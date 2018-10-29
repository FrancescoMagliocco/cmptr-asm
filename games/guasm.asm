; vim:ft=nasm sts=6 sw=6 ts=6 et

section     .text
      global      _start
_start:
      rdrand      eax
      mov   ecx,  100
      div   ecx
      mov   eax,  edx

      mov   ebx,  2     ; amount of bytes
      sub   esp,  4 
      mov   edi,  esp

      push  edi
      push  ebx
      push  eax
      call  DecToASCII

      mov   ecx,  eax
      mov   edx,  ebx

      mov   eax,  4
      mov   ebx,  1
      int   0x80

      mov   eax,  1
      mov   ebx,  0
      int   0x80

; size_t DecToASCII(unsigned int number, size_t length, char *buf)
DecToASCII:
      push  ebp
      mov   ebp,  esp
      
      mov   ecx,  [ebp+12]
      mov   eax,  [ebp+8]
      mov   edi,  [ebp+16]
      mov   ebx,  10 

      .loop:
            mov   edx,              0
            div   ebx
            add   edx,              '0'
            mov   [edi+ecx-1],      dl
            
            cmp   eax,              0
            jz    .endloop
            
            loop  .loop

.endloop:
      mov   eax,  [ebp+12]
      sub   eax,  ecx

      mov   ecx,  edi
      mov   edi,  [ebp+16]
      mov   ebx,  [ebp+12]

      pop   ebp
      ret

section     .data

