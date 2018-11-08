; vim:ft=nasm sts=6 sw=6 ts=6 et

section     .text
      global      _start
_start:
      mov   eax,  4           ; sys_write
      mov   ebx,  1           ; stdout
      mov   ecx,  maxmsg
      mov   edx,  maxmsgL
      int   0x80

      ; gets what the user wants for the maximum winning number.
      ; max winning number will actually be the number entered - 1
      mov   eax,  3           ; sys_read
      mov   ebx,  0           ; stdin
      mov   ecx,  max
      mov   edx,  4
      int   0x80

      ; we are storing the amount of bytes the user had entered so I can use it
      ; in the loop in DecToASCII to determine the correct ordering, so the
      ; output is not reversed.
      push  eax

      ; code provided by koisoke
      ; this will terminate with esi one place ahead of the first byte rejected
      ;     I have no idea what that means
      ; Is this still an issue?
      ; -----------------------------------------------------------------------
      mov   esi,  max
      mov   ebx,  10

      xor   eax,  eax
      xor   ecx,  ecx
      
      ; convert ascii to decimal
      .loop:
            mul   ebx
            add   eax,  ecx

            mov   cl,   [esi]
            inc   esi

            sub   cl,   '0'
            cmp   cl,   9
            jna   .loop
      ; -----------------------------------------------------------------------

      ; moving eax which is the result of the conversion to ebx, as it will be
      ; used as the divisor.  We also need it free for rdrand.
      mov   ebx,  eax
      rdrand      eax

      ; edx will be the winning number
      div   ebx

      ; we are popping ebx out, which is the number of entered bytes by the
      ; user, including lf, so we can allocate space on the stack to be used as
      ; a buffer for when calling DecToASCII
      pop   ebx

      sub   esp,  4 
      mov   edi,  esp

      ; if the user just pressed enter, some flag will be thrown, Underflow?
      ; if the user entered 69, the amount of bytes that would have been
      ; entered would be 3 as lf is also included.
      ;     forgive my wording here
      ; as the stack is zero-based, we subtract 2 because we do not want
      ; to include lf, and we need to compensate for how the stack counts.
      sub   ebx,  2
      
      push  ebx         ; arg 4 - length of arg 1 (zero-based)
      push  dword 10    ; arg 3 - base
      push  edi         ; arg 2 - buffer
      push  edx         ; arg 1 - unsigned int to be converted
      call  DecToASCII

      mov   edx,  eax
      mov   ecx,  edi

      mov   eax,  4     ; sys_write
      mov   ebx,  1     ; stdout
      int   0x80

      mov   eax,  1     ; sys_exit
      mov   ebx,  0     ; exit code 0
      int   0x80

; I WILL FIX THE NAME LATER
; size_t DecToASCII(unsigned  int         number,
;                             char        *buf,
;                   unsigned  int         base,
;                   size_t                len)
DecToASCII:
      pushad
      mov   ebp,  esp

      xor   ecx,  ecx
      xor   eax,  eax
      xor   ebx,  ebx

      mov   eax,  [ebp+36]
      mov   edi,  [ebp+40]

      .loop:
            xor   edx,              edx
            div   dword             [ebp+44]
            add   edx,              '0'
            
            ; we keep moving arg 4 (length of arg 1 (zero-based)) back into ebx
            ; because we modify it by the loop counter to get the correct
            ; position to place the converted byte into the buffer.
            mov   ebx,              [ebp+48]
            sub   ebx,              ecx

            mov   [edi+ebx],        dl
            inc   ecx
            test  eax,              eax
            jnz   .loop

      ; is this even needed?  Or can I just mov [ebp+28], ecx?
      mov   eax,        ecx
      mov   [ebp+28],   eax

      mov   esp,        ebp
      popad
      ret

section     .data
      maxmsg:     db    "Enter max winning number: "
      maxmsgL:    equ   $ - maxmsg
      max:        dd    0
