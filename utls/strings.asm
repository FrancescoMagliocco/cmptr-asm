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
isUpperAt:
      mov   dl,   'A'
      mov   cl,   'Z' 
      call  isULAt
      ret
      
; int
; isLowerAt(            char        *str,
;           unsigned    int         index,
isLowerAt:
      mov   dl,   'a'
      mov   cl,   'z'
      call  isULAt
      ret


; int
; isULAt(               char        *str,
;        unsigned       int         index,
;        unsigned       int         low,
;        unsigned       int         high)
isULAt:
      xor   eax,  eax

      cmp         byte  [edi+esi],  dl
      jb          .ret
      cmp         byte  [edi+esi],  cl

      cmovbe      eax,  [edi+esi]
.ret:
      ret
