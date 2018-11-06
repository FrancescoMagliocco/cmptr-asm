; vim:ft=nasm sts=6 sw=6 ts=6 et

section     .text
      global      _start
_start:
      mov   eax,  4
      mov   ebx,  1
      mov   ecx,  maxmsg
      mov   edx,  maxmsgL
      int   0x80

      mov   eax,  3
      mov   ebx,  0
      mov   ecx,  max
      mov   edx,  4
      int   0x80

      mov   ebx,  10
      mov   edx,  eax
      mov   eax,  0
      mov   edi,  0
      ; I feel like I should used use eax to determine how many iteraions to use
      .loop:
            mov   esi,        max
            
            ja    .next

            jb    .next
            mul   ebx
            add   eax,  [max-'0']
            inc   edi
            jmp   .loop

.next:
      mov   ecx,  eax
      pop   eax

      mov   edx,  eax
      mov   eax,  4
      mov   ebx,  1
      cmp   ecx, 51
      ja    .1
      int   0x80
.1:

      mov   eax,  1
      mov   ebx,  0
      int   0x80

      rdrand      eax

      mov   ecx,  max

      ; I feel like ecx isn't the standard register to use for this
      div   ecx

.2:
      mov   edx,  ecx
      sub   esp,  4 
      mov   edi,  esp

      push  dword 10
      push  edi
      push  edx
      call  DecToASCII

      mov   edx,  eax
      mov   ecx,  edi

      mov   eax,  4
      mov   ebx,  1
      int   0x80

      mov   eax,  1
      mov   ebx,  0
      int   0x80

; I WILL FIX THE NAME LATER
; size_t DecToASCII(unsigned  int         number,
;                             char        *buf,
;                   unsigned  int         base)
DecToASCII:
      pushad
      mov   ebp,  esp

      xor   ecx,  ecx
      xor   eax,  eax
      mov   eax,  [ebp+36]
      mov   edi,  [ebp+40]

      .loop:
            xor   edx,              edx
            div   dword             [ebp+44]
            add   edx,              '0'
            mov   [edi+ecx],        dl
            inc   ecx
            test  eax,              eax
            jnz   .loop

.done:
      mov   eax,        ecx
      mov   [ebp+28],   eax

      mov   esp,        ebp
      popad
      ret

section     .data
      maxmsg:     db    "Enter max winning number: "
      maxmsgL:    equ   $ - maxmsg
      max:        dd    0
