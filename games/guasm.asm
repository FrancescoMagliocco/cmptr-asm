; vim:ft=nasm sts=6 sw=6 ts=6 et

section     .text
      global      _start
_start:
      rdrand      eax
      mov   ecx,  100
      div   ecx
;      mov   eax,  edx

      mov   ebx,  2     ; amount of bytes
      sub   esp,  4 
      mov   edi,  esp

      push  dword 10
      push  edi
      push  dword 2
      push  edx
      call  DecToASCII

      mov   edx,  eax
;      mov   ecx,  ecx

      mov   eax,  4
      mov   ebx,  1
      int   0x80

      mov   eax,  1
      mov   ebx,  0
      int   0x80

; I WILL FIX THE NAME LATER
; size_t DecToASCII(unsigned  int         number,
;                             size_t      length,
;                             char        *buf,
;                   unsigned  int         base)
DecToASCII:
      pusha
      mov   ebp,  esp

      xor   ecx,  ecx
      mov   eax,  [ebp+8]
      mov   edi,  [ebp+16]

      .loop:
            xor   edx,              edx
            div   dword             [ebp+20]
            add   edx,              '0'
            mov   [edi+ecx-1],      dl
            cmp   eax,              0
            inc   ecx
            jnz   .loop

.done:
      mov   eax,  [ebp+12]
      sub   eax,  ecx
      inc   eax

      mov   esp,  ebp
      popa
      ret

section     .data

