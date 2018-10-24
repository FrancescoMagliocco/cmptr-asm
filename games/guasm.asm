; vim:ft=nasm sts=6 sw=6 ts=6 et

section     .text
      global      _start
_start:
      rdrand      eax

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
;     eax   = address pointing to bytes to be converted to ascii
; out:
;     ecx   = address pointing to bytes that were converted to ascii
;     edx   = amount of bytes ecx contains
DecToASCII:
      ; prologue --------------------------------------------------------------
;      push  ebp
      push  eax
      push  ebx
;      mov   ebp,  esp
;      sub   esp,  0xa

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
      mov   edx,  ecx
      inc   edx
      mov   ecx,  edi

      ; epilogue --------------------------------------------------------------
;      mov   esp,  ebp
      pop   ebx
      pop   eax

;      pop   ebp
      ret

section     .data

