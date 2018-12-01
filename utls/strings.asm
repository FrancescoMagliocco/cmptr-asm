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
      jmp   isULAt

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
; NOTE: Is there a better way of doing this?
isLetterAt:
      call  isLowerAt
      jz    $+5
      mov   ah,   1
      ret
      call  isUpperAt

      ; double check this is accurate
      ; NOTE: read more on instruction encoding
      jz    $+10
      mov   al,   1
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
            
            ; would it be better to just create a label and jump to it?
            jz    .loop+6

           ; call  isUpperAt
            test  al,   al

            jz    .ret
            loop  .loop
.ret:
      ; we return the index + 1 of which was not an uppercase, or 0 if all
      ; uppercase.
      mov   rax,  rcx
      ret
