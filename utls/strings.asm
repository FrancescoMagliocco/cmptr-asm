section     .data
      msg:  db    "hELLOWORLD"
      msgL: equ   $ - msg

[BITS 64]
section     .text
      global      _start
_start:
      mov   rdi,  msg
      mov   rsi,  msgL
      call  isUpper
      mov   rax,  60
      mov   rdi,  0
      syscall

; int
; isUpperAt(            char        *str,
;           unsigned    int         index,
isUpperAt:
      mov   dl,   'A'
      jmp   isULAt
      
; int
; isLowerAt(            char        *str,
;           unsigned    int         index,
isLowerAt:
      mov   dl,   'a'

; int
; isULAt(               char        *str,
;        unsigned       int         index,
;        unsigned       int         low,
isULAt:
      xor   rax,  rax
      mov   al,   [rdi+rsi]
      sub   al,   dl
      cmp   al,   25
      ja    .outOfRange
      add   al,   dl
      ret
.outOfRange:
      xor   rax,  rax      
      ret

; int
; isLetterAt(           char  *str,
;            unsigned   int   index)
; returned value is results of 'isLowerAt'
isLetterAt:
      ; should I store this on stack instead?
      mov   dh,   [rdi+rsi]
      or    byte  [rdi+rsi],  0x20
      call  isLowerAt
      mov   byte  [rdi+rsi],  dh
      ret

; int
; isUpper(char    *str,
;         size_t  len)
; will start from the most significant byte in str which is determened by
; len - 1, and will iterate down checking if each byte is uppercase.
;
; during the iteration, if any bytes are not in uppercase, the position + 1 of
; that byte will be returned.
;
; if str is all uppercase, 0 will be returned.
isUpper:
      ; if len is 0, we will just use that as the index
      test  rsi,  rsi
      jz    isUpperAt

      mov   rcx,  rsi
      .loop:
            lea   rsi,  [rcx-1]
            call  isLetterAt
            jz    .continue
            cmp   byte [rdi+rsi],   'Z'
            jae   .ret
.continue:
            loop  .loop
.ret:
      ; we return the index + 1 of which was not an uppercase, or 0 if all
      ; uppercase.
      mov   rax,  rcx
      ret
