; vim:ft=nasm sts=6 sw=6 ts=6 et

section     .text
      global      _start
_start:
      rdrand      eax
      mov   ecx,  100
      div   ecx
      xor   eax,  eax
      mov   eax,  edx

      sub   esp,  10
      mov   edi,  esp
      call  DecToASCII

      mov   eax,  0x4
      mov   ebx,  0x1
      int   0x80

      mov   eax,  0x1
      mov   ebx,  0x0
      int   0x80

; DecToASCII
;     convert decimal to ascii
;
; args:
;     eax   = pointer to bytes to be converted
; out:
;     ecx   = address pointing to bytes that were converted to ascii
;     edx   = amount of bytes ecx contains
DecToASCII:
      ; prologue --------------------------------------------------------------
      push  eax
      push  ebx

      ; body ------------------------------------------------------------------
      mov   ebx,  0xa
      mov   ecx,  0xa

      .loop: ; ----------------------------------------------------------------
            mov   edx,        0x0
            div   ebx
            add   edx,        0x30
            mov   [edi+ecx],  dl
            
            cmp   eax,        0x0
            jz    .endloop
            
            loop  .loop

.endloop:
      add   edi,  ecx
      mov   edx,  0xb
      sub   edx,  ecx
      mov   ecx,  edi

      ; epilogue --------------------------------------------------------------
      pop   ebx
      pop   eax

      ret

section     .data

