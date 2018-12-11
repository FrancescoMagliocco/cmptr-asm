;# input:  RDI    char* string
;# input:  RSI    int   len			# is this actually needed?
;# input:  RDX    int   (*fp)(char*,uint index)	# what is this supposed to do?
;#						# (unimplemented)
;# output: RAX -- 0		: all upper case letters;
;#				  or string==NULL or len==0 (string==NULL
;#				  should set errno in real world apps);
;#                positive n+1	: for lower case letter at position n;
;#                negative -n-1	: for non-alpha char at position n;

section     .data
      msg:  db    "hELLOWORLD"
      msgL: equ   $-msg

[BITS 64]
section     .text
global      _start
_start:
      mov   rdi,  msg
      mov   rsi,  msgL
      call  isStrUL

      mov   rax,  60
      mov   rdi,  0
      syscall

isStrUL:
		xor	ecx,ecx		;# clear counter;
		test	rdi,rdi		;# test for string==NULL
		setz	ah
		test	rsi,rsi		;#      and len==0;
		setz	al
		test	ax,ax
		jnz	lowCs			;# since ecx==0, this works, though the
						;	# label appears somewhat misleading;

		xchg	rdi,rsi		;# swap for rsi to be used with lods;
		xor	eax,eax

l00p:	
;      lods	al,[rsi]	;# auto increments;
            lodsb
		btr	eax,5			;# clear bit 5 of char;
            ; if bit 5 was set, CF is set
            ; if bit 3 was not set, CF is not set
		setc	ah			;# 1 if bit 5 (0x20) was set (upper case);
		sub	al,'A'
		cmp	al,25
		seta    al			;# 1 if not alpha;
		test	ax,ax
		jnz	notUL
		add	rcx,1
		cmp	rdi,rcx		;	# remember: rsi/rdi swapped above;
		jne	l00p

		ret				;	# eax will be 0 if last char was upper case;

;# digits, for example, are out of range (al=1), but also have bit 5 set (ah=1),
;# so we need to check for al first;

notUL:	
            add rcx, 1
            mov	rdx,rcx
            neg   rdx
;		not	rdx		;# = -n-1;
		or	al,al
		cmovnz	rcx,rdx

lowCs:	mov	rax,rcx
		ret
