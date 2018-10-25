; vim:ft=nasm sts=6 sw=6 ts=6 et

section     .text
      global      _start
_start:
      rdrand      eax
      mov   ecx,  100
      div   ecx
      xor   eax,  eax
      mov   eax,  edx

      mov   ebx,  0x2         ; amount of bytes
      sub   esp,  0x4
      mov   edi,  esp
      call  DecToASCII

      mov   ecx,  eax
      mov   edx,  ebx

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
;     ebx   = amount of bytes
; out:
;     eax   = 
DecToASCII:
      ; prologue --------------------------------------------------------------
      push  ebx
      push  ecx
      push  edx
      push  edi

      ; body ------------------------------------------------------------------
      mov   ecx,  ebx
      mov   ebx,  0xa

      .loop: ; ----------------------------------------------------------------
            mov   edx,        0x0
            div   ebx
            add   edx,        0x30
            mov   [edi+ecx],  dl
            
            cmp   eax,        0x0
            jz    .endloop
            
            loop  .loop

.endloop:
      lea   eax,  [edi+0x1]   ; if no + 1, oboe
;      mov   eax,  edi
;      inc   eax
      
      ; epilogue --------------------------------------------------------------
      pop   edi
      pop   edx
      pop   ecx
      pop   ebx

      ret

section     .data

