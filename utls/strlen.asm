section     .data
      msg:  db    "Hello world"
      msgL:  db    "Hello world"

[BITS 64]
section     .text
      global      _start
_start:
      xor   rcx,  rcx
      mov   rsi,  msg
      .loop:
            ; only works if string is null terminated
            cmp   byte  [rsi],  0
            je    .done
            lodsb
            inc   rcx
            jmp   .loop

.done:
      mov   rax,  60
      mov   rdi,  0
      syscall
