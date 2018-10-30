; vim:ft=nasm sts=6 sw=6 ts=6 et

section     .text
      global      _start
_start:
      rdrand      eax
      mov   ecx,  100
      div   ecx

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

