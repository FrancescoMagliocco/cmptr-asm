[BITS 64]
section     .text
      global      _start
_start:
      sub   rsp,  32
      mov   rbx,  rsp   ; using rbx as it is callee saved

      mov   rdi,  rbx
      mov   rsi,  69
      mov   edx,  10
      call  dectoascii
      mov   rsi,  rbx

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
      mov   eax,  esi
      .L1:
            xor   edx,        edx
            div   r8d
            add   edx,        '0'
            dec   rsp
            mov   [rsp],      dl
            inc   rcx
            test  eax,        eax
            jne   .L1
      mov   rax,  rcx
      mov   rsi,  rsp

      rep   movsb
      ; not sure if I should leave as is, or use
      ; lea rsp, [rsp+rax] or
      ; add rsp, rax
      mov   rsp,  rsi         ; return address
      ret   

