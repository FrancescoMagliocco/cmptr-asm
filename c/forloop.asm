section     .data
      num:  db    "69"

section     .text
      global      _start
_start:
      push  num
      call  strtodec

      mov   eax,  1
      mov   ebx,  0
      int   0x80

; unsigned int strtodec(char *str)
strtodec:
      push  ebx
      mov   ecx,        [esp+8]
      movsx edx,  byte  [ecx]
      lea   eax,        [edx-48]
      cmp   al,   9
      mov   eax,  0
      ja    .L1
      
      .loop:
            lea   eax,        [eax+eax*4]
            add   ecx,  1
            lea   eax,        [edx-48+eax*2]
            movsx edx,  byte  [ecx]
            lea   ebx,        [edx-48]
            cmp   bl,   9
            jbe   .loop

.L1:
      pop   ebx
      ret
