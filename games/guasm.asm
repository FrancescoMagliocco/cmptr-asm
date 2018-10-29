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

      push  eax
      push  ebx
      push  edi
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
;     eax   = unsigned value to convert
;     ebx   = amount of bytes
;     edi   = pointer to destination buffer
; out:
;     eax   = converted
DecToASCII:
      push  ebp
      mov   ebp,  esp
      
      push  ebx
      push  ecx
      push  edx
      push  edi

      mov   ecx,  [ebp+8]
;      mov   ecx,  ebx
      mov   eax,  [ebp+12]
      mov   ebx,  10 

      .loop:
            mov   edx,              0
            div   ebx
            add   edx,              '0'
            mov   [ebp+16+ecx-1],   dl
;            mov   [edi+ecx-1],      dl
            
            cmp   eax,              0
            jz    .endloop
            
            loop  .loop

.endloop:
;      mov   eax,  edi
      mov   eax,  [ebp+16]
      
      pop   edi
      pop   edx
      pop   ecx
      pop   ebx
      ret

section     .data

