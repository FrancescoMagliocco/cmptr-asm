section     .data
      msg:  db    "hELLOWORLD"
      msgL: equ   $ - msg

[BITS 64]
section     .text
      global      _start
_start:
      mov   rdi,  msg
      mov   rsi,  msgL
      mov   rdx,  isLowerAt
      mov   cl,   'A'
      call  isStrUL
      mov   rax,  60
      mov   rdi,  0
      syscall

; int
; isUpperAt(            char        *str,
;           unsigned    int         index,
; checks if byte at index in str is an uppercase.
;
; if said byte is an uppercase, ascii value of letter is returned.
;
; if said byte is not an uppercace, 0 will be returned.
isUpperAt:
      mov   dl,   'A'
      jmp   isULAt
      
; int
; isLowerAt(            char        *str,
;           unsigned    int         index,
; checks if byte at index in str is a lowercase.
;
; if said byte is an lowercase, ascii value of letter is returned.
;
; if said byte is not an lowercace, 0 will be returned.
isLowerAt:
      mov   dl,   'a'

; int
; isULAt(               char        *str,
;        unsigned       int         index,
;        unsigned       int         low,
;
; this is intended for internal use
isULAt:
      xor   rax,  rax
      mov   al,   [rdi+rsi]
      sub   al,   dl

      ; if the sub results in normalization, we know the byte isn't what we are
      ; looking for.
      jc    .outOfRange
      cmp   al,   25
      ja    .outOfRange

      ; we add what we subtracted previously, so the return value is that of
      ; the corresponding byte.
      add   al,   dl
      ret
.outOfRange:
      xor   rax,  rax      
      ret

; int
; isLetterAt(           char  *str,
;            unsigned   int   index)
; checks if byte at index in str is a valid letter.  [a-Z]
;
; if said byte is a valid letter, the corresponding ascii representation for
; that byte will be returned.
;
; if said byte is not a valid letter, 0 will be returned.
isLetterAt:
      ; should I store this on stack instead?
      mov   dh,   [rdi+rsi]
      or    byte  [rdi+rsi],  0x20
      call  isLowerAt

      ; if [rdi+rsi] is already a lowercase, this is redundant
      mov   byte  [rdi+rsi],  dh

      ; condition is set prior to returning from isLowerAt
      jz    .ret

      ; if is a valid letter, move the original into al for the return value
      ; if [rdi+rsi] is already a lowercase, this is redundant as rax was
      ; already set prior to returning from the isLowerAt
      mov   al,               dh
.ret:
      ret

; int
; isStrUL(              char        *str,
;                       size_t      len,
;                       int         (*fp)(            char  *str,
;                                         unsigned    int   index),
;         unsigned      int         *low)
; will start from the most significant byte in str which is determened by
; len - 1, and will iterate down checking if each byte is uppercase.
;
; during the iteration, if any bytes are not in uppercase, the position + 1 of
; that byte will be returned.
;
; if str is all uppercase, 0 will be returned.
;
; this is intended for internal use.  Documentation is not 100% accurate for
; this routine.
isStrUL:
      ; if len is 0, we will treat it as if the caller was trying to check at
      ; index 0, rather than the whole string.
      test  rsi,  rsi
      jnz   .preLoop

      ; push fp into stack so when we ret, we call that function
      push  rdx
      ret
.preLoop:
      ; commented out for now.  Originally thought I would use it in the loop
;      mov   r8,   rdx
      ; FIXME: all REX byte registers are not defined as nasmGen64Register in
      ; vim for highlight groupes.  They are defined as nasmLabel
      mov   r9b,  cl

      mov   rcx,  rsi
      xor   rsi,  rsi
      .loop:
;            lea   rsi,  [rcx-1]
            call  isLetterAt

            ; condition is set prior to returning from isLetterAt
            jz    .continue

            ; al is set from within the call to isLetterAt.
            sub   al,   r9b
            cmp   al,   25
            ja    .preRet
.continue:
            inc   rsi
            cmp   rsi,  rcx
            jb    .loop
.preRet:
      cmp   rsi,  rcx
      jne   .ret
      xor   rax,  rax
      ret

.ret:
      lea   rax,  [rsi+1]
      ret
