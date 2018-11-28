section     .data
      msg:  db    "Hello World!"
      msgL: equ   $ - msg

[BITS 64]
section     .text
      global      _start
_start:
      mov   rdi,  msg
      mov   rsi,  1
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
      xor   rax,  rax
      mov   al,   [rdi+rsi]
      sub   al,   dl
      sub   cl,   dl
      cmp   al,   cl

      jb          .ret
      cmp         [rdi+rsi],  cl

      cmovbe      eax,  [rdi+rsi]
.ret:
      ret
