section     .data
      msg:  db    "Hello World!"
      msgL: equ   $ - msg

[BITS 64]
section     .text
      global      _start
_start:
      mov   rdi,  msg
      mov   rsi,  0
      mov   rdx,  msgL
      call  isUpperAt
      mov   rax,  60
      mov   rdi,  0
      syscall

; int
; isUpperAt(            char        *str,
;           unsigned    int         index,
;                       size_t      size)
isUpperAt:
      xor   eax,  eax
      
      ; if index is greater or equal to the size, index will be out of range
      cmp   esi,  edx
      jae   .ret
      
.next:
      cmp         byte  [edi+esi],      'A'
      jb          .ret
      cmp         byte  [edi+esi],      'Z'

      cmovbe      eax,  [edi+esi]
.ret:
      ret
