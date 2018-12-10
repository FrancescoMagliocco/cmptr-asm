; param 1 = eax value
; param 2 = eax, ebx, ecx, edx
; param 3 = bit to test
; NOTE:     This will not work if ecx is used along with eax for leaf(?)
%macro      getcpuid    3
      ; I'm not sure if I should check (somehow) if %2 is ebx or not before
      ; pushing it on the stack for preservation.
      ; Pushing rbx rather than ebx just in case if the higher 32 bits of rbx
      ; contain data.
      push  rbx

      ; cpuid on Intel 64 processors, clears the high 32 bits of rax, rbx, rcx
      ; and rdx.
      xor   eax,  eax
      mov   eax,  %1
      cpuid
      bt    %2,   %3

      ; Not sure if I shouuld set eax accordingly to CF then ret, or just ret
      ; and have the caller implement their own way of interpreting the
      ; results.

      pop   rbx

      ; This may be a bad idea if there is instructions following invocation.
      ret
%endmacro

[BITS 64]
section     .text
      global      _start
_start:
      mov   rax,  999
      mov   rax,  1
      call  ftMMX

      mov   rax,  60
      mov   rdi,  0
      syscall

ftMMX:
      getcpuid    1,    edx,  23
