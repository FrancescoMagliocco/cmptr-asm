; vim:ft=nasm sts=6 sw=6 ts=6 et

section     .text
      global      _start
_start:
      rdrand      eax
      mov   ecx,  100
      div   ecx
      xor   eax,  eax
      mov   eax,  edx

      mov   ebx,  2     ; amount of bytes
      sub   esp,  4 
      mov   edi,  esp
      call  DecToASCII

      mov   ecx,  eax
      mov   edx,  ebx

      mov   eax,  4
      mov   ebx,  1
      int   0x80

      mov   eax,  1
      mov   ebx,  0
      int   0x80

; DecToASCII
;     convert decimal to ascii
;
; args:
;     eax   = pointer to bytes to be converted
;     ebx   = amount of bytes
; out:
;     eax   = pointer to bytes converted
DecToASCII:
      push  ebx
      push  ecx
      push  edx
      push  edi

      mov   ecx,  ebx
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
      mov   eax,  edi
      
      pop   edi
      pop   edx
      pop   ecx
      pop   ebx
      ret

section     .data

