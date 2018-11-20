[BITS 64]
section     .text
      global      _start
_start:
      sub   rsp,  32
      mov   rsi,  rsp

      mov   edi,  69
      mov   edx,  10
      push  rsi
      call  dectoascii
      pop   rsi

      mov   rdx,  rax
      mov   rax,  1
      mov   rdi,  1
      syscall

      mov   rax,  60
      mov   rdi,  0
      syscall

dectoascii:
      xor   ecx,  ecx

      mov   r8d,  edx
      mov   eax,  edi
      .countdigits:
            xor   edx,  edx
            div   r8d

            cmp   eax,  0
            je    .digitscounted

            inc   ecx
            jmp   .countdigits
.digitscounted:

      mov   r9d,  ecx
      mov   eax,  edi
      .conversion:
            xor   edx,        edx
            div   r8d

            add   edx,        '0'
            mov   [rsi+rcx],  dl

            cmp   ecx,        0
            je    .doneconversion

            dec   ecx
            jmp   .conversion
.doneconversion:
      ; add one because the amount of digits is zero-base
      lea   rax,  [r9+1]
      ret
