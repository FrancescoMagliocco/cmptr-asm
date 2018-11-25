; these are syscalls for x86_64 linux

%assign     SYS_READ                0
%assign     SYS_WRITE               1
%assign     SYS_OPEN                2
%assign     SYS_CLOSE               3
%assign     SYS_STAT                4
%assign     SYS_FSTAT               5
%assign     SYS_LSTAT               6
%assign     SYS_POLL                7
%assign     SYS_LSEEK               8
%assign     SYS_MMAP                9
%assign     SYS_MPROTECT            10
%assign     SYS_MUNMAP              11
%assign     SYS_BRK                 12
%assign     SYS_RT_SIGACTION        13
%assign     SYS_RT_SIGPROCMASK      14
%assign     SYS_RT_SIGRETURN        15
%assign     SYS_IOCTL               16
%assign     SYS_PREAD64             17
%assign     SYS_PWRITE64            18
%assign     SYS_READV               19
%assign     SYS_WRITEV              20
%assign     SYS_ACCESS              21
%assign     SYS_PIPE                22
%assign     SYS_SELECT              23
%assign     SYS_SCHED_YIELD         24
%assign     SYS_MREMAP              25
%assign     SYS_MSYNC               26

%macro      sys.read                3
      mov   rax,  0
      mov   rdi,  %1    ;           unsigned    int         fd
      mov   rsi,  %2    ;                       char        *buf
      mov   rdx,  %3    ;                       size_t      count
      syscall
%endmacro

%macro      sys.write               3
      mov   rax,  1
      mov   rdi,  %1    ;           unsigned    int         fd
      mov   rsi,  %2    ; const                 char        *buf
      mov   rdx,  %3    ;                       size_t      count
      syscall
%endmacro

%macro      sys.open                3
      mov   rax,  2
      mov   rdi,  %1    ; const                 char        *filename
      mov   rsi,  %2    ;                       int         flags
      mov   rdx,  %3    ;                       int         mode
      syscall
%endmacro

%macro      sys.close               1
      mov   rax,  3
      mov   rdi,  %1    ;           unsigned    int         fd
      syscall
%endmacro

%macro      sys.stat                2
      mov   rax,  4
      mov   rdi,  %1    ; const                 char        *filename
      mov   rsi,  %2    ;           struct      stat        *statbuf
      syscall
%endmacro

%macro      sys.fstat               2
      mov   rax,  5
      mov   rdi,  %1    ;           unsigned    int         fd
      mov   rsi,  %2    ;           struct      stat        *statbuf
      syscall
%endmacro

%macro      sys.lstat               2
      mov   rax,  6
      mov   rdi,  %1    ; fconst                char        *filename
      mov   rsi,  %2    ;           struct      stat        *statbuf
      syscall
%endmacro

%macro      sys.poll                3
      mov   rax,  7
      mov   rdi,  %1    ;           struct      poll_fd     *ufds
      mov   rsi,  %2    ;           unsigned    int         nfds
      mov   rdx,  %3    ;                       long        timeout_msecs
      syscall
%endmacro

%macro      sys.lseek               3
      mov   rax,  8
      mov   rdi,  %1    ;           unsigned    int         fd
      mov   rsi,  %2    ;                       off_t       offset
      mov   rdx,  %3    ;           unsigned    int         origin
      syscall
%endmacro

%macro      sys.mmmap               6
      mov   rax,  9
      mov   rdi,  %1    ;           unsigned    long        addr
      mov   rsi,  %2    ;           unsigned    long        len
      mov   rdx,  %3    ;           unsigned    long        prot
      mov   r10,  %4    ;           unsigned    long        flags
      mov   r8,   %5    ;           unsigned    long        fd
      mov   r9,   %6    ;           unsigned    long        off
      syscall
%endmacro

%macro      sys.mprotect            3
      mov   rax,  10
      mov   rdi,  %1    ;           unsigned    long        start
      mov   rsi,  %2    ;                       size_t      len
      mov   rdx,  %3    ;           unsigned    long        prot
      syscall
%endmacro

%macro      sys.munmap              2
      mov   rax,  11
      mov   rdi,  %1    ;           unsigned    long        addr
      mov   rsi,  %2    ;                       size_t      len
      syscall
%endmacro

%macro      sys.brk                 1
      mov   rax,  12
      mov   rdi,  %1    ;           unsigned    long        brk
      syscall
%endmacro

%macro      sys.rtSigaction         4
      mov   rax,  13
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4    ;                       size_t      sigsetsize
      syscall
%endmacro

%macro      sys.rtSigprocmask       4
      mov   rax,  14
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4    ;                       size_t      sigsetsize
      syscall
%endmacro

%macro      sys.rtSigreturn         1
      mov   rax,  15
      mov   rdi,  %1    ;           unsigned    long        __unused
      syscall
%endmacro

%macro      sys.ioctl               3
      mov   rax,  16
      mov   rdi,  %1    ;           unsigned    int         fd
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    long        arg
      syscall
%endmacro

%macro      sys.pread64             4
      mov   rax,  17
      mov   rdi,  %1    ;           unsigned    long        fd
      mov   rsi,  %2    ;                       char        *buf
      mov   rdx,  %3    ;                       size_t      count
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.pwrite64            4
      mov   rax,  18
      mov   rdi,  %1    ;           unsigned    int         fd
      mov   rsi,  %2    ; const                 char        *buf
      mov   rdx,  %3    ;                       size_t      count
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.readv               3
      mov   rax,  19
      mov   rdi,  %1    ;           unsigned    long        fd
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    long        vlen
      syscall
%endmacro

%macro      sys.writev              3
      mov   rax,  20
      mov   rdi,  %1    ;           unsigned    long        fd
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    long        vlen
      syscall
%endmacro

%macro      sys.access              2
      mov   rax,  21
      mov   rdi,  %1    ; const                 char        *filename
      mov   rsi,  %2    ;                       int         mode
      syscall
%endmacro

%macro      sys.pipe                1
      mov   rax,  22
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.select              5
      mov   rax,  23
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5
      syscall
%endmacro

%macro      sys.schedYield          0
      mov   rax,  24
      syscall
%endmacro

%macro      sys.mremap              5
      mov   rax,  25
      mov   rdi,  %1    ;           unsigned    long        addr
      mov   rsi,  %2    ;           unsigned    long        old_len
      mov   rdx,  %3    ;           unsigned    long        new_len
      mov   r10,  %4    ;           unsigned    long        flags
      mov   r8,   %5    ;           unsigned    long        new_addr
      syscall
%endmacro

%macro      sys.msync               3
      mov   rax,  26
      mov   rdi,  %1    ;           unsigned    long        start
      mov   rsi,  %2    ;                       size_t      len
      mov   rdx,  %3    ;                       int         flags
      syscall
%endmacro

%macro      sys.mincore             3
      mov   rax,  27
      mov   rdi,  %1    ;           unsigned    long        start
      mov   rsi,  %2    ;                       size_t      len
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.madvise             3
      mov   rax,  28
      mov   rdi,  %1    ;           unsigned    long        start
      mov   rsi,  %2    ;                       size_t      len_in
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.shmget              3
      mov   rax,  29
      mov   rdi,  %1
      mov   rsi,  %2    ;                       size_t      size
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.shmat               3
      mov   rax,  30
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %2
      syscall
%endmacro

%macro      sys.shmctl              3
      mov   rax,  31
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.dup                 1
      mov   rax,  32
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.dup2                2
      mov   rax,  33
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.pause               0
      mov   rax,  34
      syscall
%endmacro

%macro      sys.nanosleep           2
      mov   rax,  35
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.getitimer           2
      mov   rax,  36
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.alarm               1
      mov   rax,  37
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.setitimer           3
      mov   rax,  38
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.getpid              0
      mov   rax,  39
      syscall
%endmacro

%macro      sys.sendfile            4
      mov   rax,  40
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4    ;                       size_t      count
      syscall
%endmacro

%macro      sys.socket              3
      mov   rax,  41
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.connect             3
      mov   rax,  42
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.accept              3
      mov   rax,  43
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.sendto              6
      mov   rax,  44
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;                       size_t      len
      mov   r10,  %4
      mov   r8,   %5
      mov   r8,   %6
      syscall
%endmacro

%macro      sys.recvfrom            6
      mov   rax,  45
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;                       size_t      size
      mov   r10,  %4
      mov   r8,   %5
      mov   r9,   %6
      syscall
%endmacro

%macro      sys.sendmsg             3
      mov   rax,  46
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.recvmsg             3
      mov   rax,  47
      mov   rax,  
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    int         flags
      syscall
%endmacro

%macro      sys.shutdown            2
      mov   rax,  48
      mov   rax,  
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.bind                3
      mov   rax,  49
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.listen              2
      mov   rax,  50
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.getsockname         3
      mov   rax,  51
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.getpeername         3
      mov   rax,  52
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.socketpair          4
      mov   rax,  53
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.setsockopt          5
      mov   rax,  54
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5
      syscall
%endmacro

%macro      sys.getsockopt          5
      mov   rax,  55
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5
      syscall
%endmacro

%macro      sys.clone               4
      mov   rax,  56
      mov   rdi,  %1    ;           unsigned    long        clone_flags
      mov   rsi,  %2    ;           unsigned    long        newsp
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.fork                0
      mov   rax,  57
      syscall
%endmacro

%macro      sys.vfork               0
      mov   rax,  58
      syscall
%endmacro

%macro      sys.execve              3
      mov   rax,  59
      mov   rdi,  %1    ; const                 char        *filename
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.exit                1
      mov   rax,  60
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.wait4               4
      mov   rax,  61
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.kill                2
      mov   rax,  62
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.uname               1
      mov   rax,  63
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.semget              3
      mov   rax,  64
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.semop               3
      mov   rax,  65
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.semctl              4
      mov   rax,  66
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.shmdt               1
      mov   rax,  67
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.msgget              2
      mov   rax,  68
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.msgsnd              4
      mov   rax,  69
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;                       size_t      msgsz
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.msgrcv              5
      mov   rax,  70
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;                       size_t      msgsz
      mov   r10,  %4
      mov   r8,   %5
      syscall
%endmacro

%macro      sys.msgctl              3
      mov   rax,  71
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.fcntl               3
      mov   rax,  72
      mov   rdi,  %1    ;           unsigned    int         fd
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    long        arg
      syscall
%endmacro

%macro      sys.flock               2
      mov   rax,  73
      mov   rdi,  %1    ;           unsigned    int         fd
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.fsync               1
      mov   rax,  74
      mov   rdi,  %1    ;           unsigned    int         fd
      syscall
%endmacro

%macro      sys.fdatasync           1
      mov   rax,  75
      mov   rdi,  %1    ;           unsigned    int         fd
      syscall
%endmacro

%macro      sys.truncate            2
      mov   rax,  76
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.ftruncate           2
      mov   rax,  77
      mov   rdi,  %1    ;           unsigned    int         fd
      mov   rsi,  %2    ;           unsigned    long        length
      syscall
%endmacro

%macro      sys.getdents            3
      mov   rax,  78
      mov   rdi,  %1    ;           unsigned    int         fd
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.getcwd              2
      mov   rax,  79
      mov   rdi,  %1    ;                       char        *buf
      mov   rsi,  %2    ;           unsigned    long        size
      syscall
%endmacro

%macro      sys.chdir               1
      mov   rax,  80
      mov   rdi,  %1    ; const                 char        *filename
      syscall
%endmacro

%macro      sys.fchdir              1
      mov   rax,  81
      mov   rdi,  %1    ;           unsigned    int         fd
      syscall
%endmacro

%macro      sys.rename              2
      mov   rax,  82
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.mkdir               2
      mov   rax,  83
      mov   rdi,  %1
      mov   rsi,  %2    ;                       int         mode
      syscall
%endmacro

%macro      sys.rmdir               1
      mov   rax,  84
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.creat               2
      mov   rax,  85
      mov   rdi,  %1
      mov   rsi,  %2    ;                       int         mode
      syscall
%endmacro

%macro      sys.link                2
      mov   rax,  86
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.unlink              1
      mov   rax,  87
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.symlink             2
      mov   rax,  88
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.readlink            3
      mov   rax,  89
      mov   rdi,  %1
      mov   rsi,  %2    ;                       char        *buf
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.chmod               2
      mov   rax,  90
      mov   rdi,  %1    ; const                 char        *filename
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.fchmod              2
      mov   rax,  91
      mov   rdi,  %1    ;           unsigned    int         fd
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.chown               3
      mov   rax,  92
      mov   rdi,  %1    ; const                 char        *filename
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.fchown              3
      mov   rax,  93
      mov   rdi,  %1    ;           unsigned    int         fd
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.lchown              3
      mov   rax,  94
      mov   rdi,  %1    ; const                 char        *filename
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.umask               1
      mov   rax,  95
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.gettimeofday        2
      mov   rax,  96
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.getrlimit           2
      mov   rax,  97
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.getrusage           2
      mov   rax,  98
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.sysinfo             1
      mov   rax,  99
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.times               1
      mov   rax,  100
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.ptrace              4
      mov   rax,  101
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    long        addr
      mov   r10,  %4    ;           unsigned    long        data
      syscall
%endmacro

%macro      sys.getuid              0
      mov   rax,  102
      syscall
%endmacro

%macro      sys.syslog              3
      mov   rax,  103
      mov   rdi,  %1
      mov   rsi,  %2    ;                       char        *buf
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.getgid              0
      mov   rax,  104
      syscall
%endmacro

%macro      sys.setuid              1
      mov   rax,  105
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.setgid              1
      mov   rax,  106
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.geteuid             0
      mov   rax,  107
      syscall
%endmacro

%macro      sys.getegid             0
      mov   rax,  108
      syscall
%endmacro

%macro      sys.setpgid             2
      mov   rax,  109
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.getppid             0
      mov   rax,  110
      syscall
%endmacro

%macro      sys.getpgrp             0
      mov   rax,  111
      syscall
%endmacro

%macro      sys.setsid              0
      mov   rax,  112
      syscall
%endmacro

%macro      sys.setreuid            2
      mov   rax,  113
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.setregid            2
      mov   rax,  114
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.getgroups           2
      mov   rax,  115
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.setgroups           2
      mov   rax,  116
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.setresuid           3
      mov   rax,  117
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.getresuid           3
      mov   rax,  118
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.setresgid           3
      mov   rax,  119
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.getresgid           3
      mov   rax,  120
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.getpgid             1
      mov   rax,  121
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.setfsuid            1
      mov   rax,  122
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.setfsgid            1
      mov   rax,  123
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.getsid              1
      mov   rax,  124
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.capget              2
      mov   rax,  125
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.capset              2
      mov   rax,  126
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.rtSigpending        2
      mov   rax,  127
      mov   rdi,  %1
      mov   rsi,  %2    ;                       size_t      sigsetsize
      syscall
%endmacro

%macro      sys.rtSigtimedwait      4
      mov   rax,  128
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4    ;                       size_t      sigsetsize
      syscall
%endmacro

%macro      sys.rtSigqueueinfo      3
      mov   rax,  129
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.rtSigsuspend        2
      mov   rax,  130
      mov   rdi,  %1
      mov   rsi,  %2    ;                       size_t      sigsetsize
      syscall
%endmacro

%macro      sys.sigaltstack         2
      mov   rax,  131
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.utime               2
      mov   rax,  132
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.mknod               3
      mov   rax,  133
      mov   rdi,  %1    ; const                 char        *filename
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

; not implemented
%macro      sys.uselib              0
      mov   rax,  134
      syscall
%endmacro

%macro      sys.personality         1
      mov   rax,  135
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.ustat               2
      mov   rax,  136
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.statfs              2
      mov   rax,  137
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.fstatfs             2
      mov   rax,  138
      mov   rdi,  %1    ;           unsigned    int         fd
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.sysfs               3
      mov   rax,  139
      mov   rdi,  %1
      mov   rsi,  %2    ;           unsigned    long        arg1
      mov   rdx,  %3    ;           unsigned    long        arg2
      syscall
%endmacro

%macro      sys.getpriority         2
      mov   rax,  140
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.setpriority         3
      mov   rax,  141
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.schedSetparam       2
      mov   rax,  142
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.schedGetparam       2
      mov   rax,  143
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.schedSetscheduler   3
      mov   rax,  144
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.schedGetscheduler   1
      mov   rax,  145
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.schedGetPriorityMax 1
      mov   rax,  146
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.schedGetPriorityMin 1
      mov   rax,  147
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.schedRrGetInterval  2
      mov   rax,  148
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.mlock               2
      mov   rax,  149
      mov   rdi,  %1    ;           unsigned    long        start
      mov   rsi,  %2    ;                       size_t      len
      syscall
%endmacro

%macro      sys.munlock             2
      mov   rax,  150
      mov   rdi,  %1    ;           unsigned    long        start
      mov   rsi,  %2    ;                       size_t      len
      syscall
%endmacro

%macro      sys.mlockall            1
      mov   rax,  151
      mov   rdi,  %1    ;                       int         flags
      syscall
%endmacro

%macro      sys.munlockall          0
      mov   rax,  152
      syscall
%endmacro

%macro      sys.vhangup             0
      mov   rax,  153
      syscall
%endmacro

%macro      sys.modifyLdt           3
      mov   rax,  154
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    long        bytecount
      syscall
%endmacro

%macro      sys.pivotRoot           2
      mov   rax,  155
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.sysctl              1
      mov   rax,  156
      mov   rdi,  %1
      syscall
%endmacro

; r8 is not used for arg 5
; r9 is used for arg 5
%macro      sys.prctl               5
      mov   rax,  157
      mov   rdi,  %1
      mov   rsi,  %2    ;           unsigned    long        arg2
      mov   rdx,  %3    ;           unsigned    long        arg3
      mov   r10,  %4    ;           unsigned    long        arg4
      mov   r9,   %5    ;           unsigned    long        arg5
      syscall
%endmacro

%macro      sys.archPrctl           3
      mov   rax,  158
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    long        *addr
      syscall
%endmacro

%macro      sys.adjtimex            1
      mov   rax,  159
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.setrlimit           2
      mov   rax,  160
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.chroot              1
      mov   rax,  161
      mov   rdi,  %1    ; const                 char        *filename
      syscall
%endmacro

%macro      sys.sync                0
      mov   rax,  162
      syscall
%endmacro

%macro      sys.acct                1
      mov   rax,  163
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.settimeofday        2
      mov   rax,  164
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.mount               5
      mov   rax,  165
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4    ;           unsigned    long        flags
      mov   r8,   %5
      syscall
%endmacro

%macro      sys.ummount2            2
      mov   rax,  166
      mov   rdi,  %1
      mov   rsi,  %2    ;                       int         flags
      syscall
%endmacro

%macro      sys.swapon              2
      mov   rax,  167
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.swapoff             1
      mov   rax,  168
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.reboot              4
      mov   rax,  169
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.sethostname         2
      mov   rax,  170
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.setdomainname       2
      mov   rax,  171
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.iopl                2
      mov   rax,  172
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.ioperm              3
      mov   rax,  173
      mov   rdi,  %1    ;           unsigned    long        from
      mov   rsi,  %2    ;           unsigned    long        num
      mov   rdx,  %3
      syscall
%endmacro

; removed in Linux 2.6
%macro      sys.createModule        0
      mov   rax,  174
      syscall
%endmacro

%macro      sys.initModule          3
      mov   rax,  175
      mov   rdi,  %1
      mov   rsi,  %2    ;           unsigned    long        len
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.deleteModule        2
      mov   rax,  176
      mov   rdi,  %1
      mov   rsi,  %2    ;           unsigned    int         flags
      syscall
%endmacro

; removed in Linux 2.6
%macro      sys.getKernelSyms       0
      mov   rax,  177
      syscall
%endmacro

; removed in Linux 2.6
%macro      sys.queryModule         0
      mov   rax,  178
      syscall
%endmacro

%macro      sys.quotactl            4
      mov   rax,  179
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.nfsservctl          0
      mov   rax,  180
      syscall
%endmacro

%macro      sys.getpmsg             0
      mov   rax,  181
      syscall
%endmacro

%macro      sys.putpmsg             0
      mov   rax,  182
      syscall
%endmacro

%macro      sys.afsSyscall          0
      mov   rax,  183
      syscall
%endmacro

%macro      sys.tuxcall             0
      mov   rax,  184
      syscall
%endmacro

%macro      sys.security            0
      mov   rax,  185
      syscall
%endmacro

%macro      sys.gettid              0
      mov   rax,  186
      syscall
%endmacro

%macro      sys.readahead           3
      mov   rax,  187
      mov   rdi,  %1
      mov   rsi,  %2    ;                       loff_t      offset
      mov   rdx,  %3    ;                       size_t      count
      syscall
%endmacro

%macro      sys.setxattr            5
      mov   rax,  188
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4    ;                       size_t      size
      mov   r8,   %5    ;                       int         flags
      syscall
%endmacro

%macro      sys.lsetxattr           5
      mov   rax,  189
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4    ;                       size_t      size
      mov   r8,   %5    ;                       int         flags
      syscall
%endmacro

%macro      sys.fsetxattr           5
      mov   rax,  190
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4    ;                       size_t      size
      mov   r8,   %5    ;                       int         flags
      syscall
%endmacro

%macro      sys.getxattr            4
      mov   rax,  191
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4    ;                       size_t      size
      syscall
%endmacro

%macro      sys.lgetxattr           4
      mov   rax,  192
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4    ;                       size_t      size
      syscall
%endmacro

%macro      sys.fgetxattr           4
      mov   rax,  193
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4    ;                       size_t      size
      syscall
%endmacro

%macro      sys.listxattr           3
      mov   rax,  194
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;                       size_t      size
      syscall
%endmacro

%macro      sys.llistxattr          3
      mov   rax,  195
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;                       size_t      size
      syscall
%endmacro

%macro      sys.flistxattr          3
      mov   rax,  196
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;                       size_t      size
      syscall
%endmacro

%macro      sys.removexattr         2
      mov   rax,  197
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.lremovexattr        2
      mov   rax,  198
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.fremovexattr        2
      mov   rax,  199
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.tkill               2
      mov   rax,  200
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.time                1
      mov   rax,  201
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.futext              6
      mov   rax,  202
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5
      mov   r9,   %6
      syscall
%endmacro

%macro      sys.schedSetaffinity    3
      mov   rax,  203
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    long        *user_mask_ptr
      syscall
%endmacro

%macro      sys.schedGetaffinity    3
      mov   rax,  204
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    long        *user_mask_ptr
      syscall
%endmacro

; NOT IMPLEMNTED
; use sys.archPrctl
%macro      sys.setThreadArea       0
      mov   rax,  205
      syscall
%endmacro

%macro      sys.ioSetup             2
      mov   rax,  206
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.ioDestory           1
      mov   rax,  207
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.ioGetevents         4
      mov   rax,  208
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.ioSubmit            3
      mov   rax,  209
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.ioCancel            3
      mov   rax,  210
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

; NOT IMPLEMENTED
; use sys.archPrctl
%macro      sys.getThreadArea       0
      mov   rax,  211
      syscall
%endmacro

%macro      sys.lookupDcookie       3
      mov   rax,  212
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.epollCreate         1
      mov   rax,  213
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.spollCtlOld         0
      mov   rax,  214
      syscall
%endmacro

%macro      sys.epollWaitOld        0
      mov   rax,  215
      syscall
%endmacro

%macro      sys.remapFilePages      5
      mov   rax,  216
      mov   rdi,  %1    ;           unsigned    long        start
      mov   rsi,  %2    ;           unsigned    long        size
      mov   rdx,  %3    ;           unsigned    long        prot
      mov   r10,  %4    ;           unsigned    long        pgoff
      mov   r8,   %5    ;           unsigned    long        flags
      syscall
%endmacro

%macro      sys.getdents64          3
      mov   rax,  217
      mov   rdi,  %1    ;           unsigned    int         fd
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.setTidAddress       1
      mov   rax,  218
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.restartSyscall      0
      mov   rax,  219
      syscall
%endmacro

%macro      sys.semtimedop          4
      mov   rax,  220
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.fadvise64           4
      mov   rax,  221
      mov   rdi,  %1
      mov   rsi,  %2    ;                       loff_t      offset
      mov   rdx,  %3    ;                       size_t      len
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.timerCreate         3
      mov   rax,  222
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.timerSettime        4
      mov   rax,  223
      mov   rdi,  %1
      mov   rsi,  %2    ;                       int         flags
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.timerGettime        2
      mov   rax,  224
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.timerGetoverrun     1
      mov   rax,  225
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.timerDelete         1
      mov   rax,  226
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.clockSettime        2
      mov   rax,  227
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.clockGettime        2
      mov   rax,  228
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.clockGetres         2
      mov   rax,  229
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.clockNanosleep      4
      mov   rax,  230
      mov   rdi,  %1
      mov   rsi,  %2    ;                       int         flags
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.exitGroup           1
      mov   rax,  231
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.epollWait           4
      mov   rax,  232
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.epollCtl            4
      mov   rax,  233
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.tgkill              3
      mov   rax,  234
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.utimes              2
      mov   rax,  235
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.vserver             0
      mov   rax,  236
      syscall
%endmacro

%macro      sys.mbind               6
      mov   rax,  237
      mov   rdi,  %1    ;           unsigned    long        start
      mov   rsi,  %2    ;           unsigned    long        len
      mov   rdx,  %3    ;           unsigned    long        mode
      mov   r10,  %4    ;           unsigned    long        *nmask
      mov   r8,   %5    ;           unsigned    long        maxnode
      mov   r9,   %6
      syscall
%endmacro

%macro      sys.setMempolicy        3
      mov   rax,  238
      mov   rdi,  %1    ;                       int         mode
      mov   rsi,  %2    ;           unsigned    long        *nmask
      mov   rdx,  %3    ;           unsigned    long        maxnode
      syscall
%endmacro

%macro      sys.getMempolicy        4
      mov   rax,  239
      mov   rdi,  %1
      mov   rsi,  %2    ;           unsigned    long        *nmask
      mov   rdx,  %3    ;           unsigned    long        maxnode
      mov   r10,  %4    ;           unsigned    long        addr
      mov   r8,   %5    ;           unsigned    long        flags
      syscall
%endmacro

%macro      sys.mqOpen              3
      mov   rax,  240
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.mqUnlink            1
      mov   rax,  241
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.mqTimedsend         5
      mov   rax,  242
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5
      syscall
%endmacro

%macro      sys.mqTimedreceive      5
      mov   rax,  243
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5
      syscall
%endmacro

%macro      sys.mqNotify            2
      mov   rax,  244
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.mqGetsetattr        3
      mov   rax,  245
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.kexecLoad           4
      mov   rax,  246
      mov   rdi,  %1    ;           unsigned    long        entry
      mov   rsi,  %2    ;           unsigned    long        nr_segments
      mov   rdx,  %3
      mov   r10,  %4    ;           unsigned    long        flags
      syscall
%endmacro

%macro      sys.waitid              5
      mov   rax,  247
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5
      syscall
%endmacro

%macro      sys.addKey              4
      mov   rax,  248
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.requestKey          4
      mov   rax,  249
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.keyctl              5
      mov   rax,  250
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5
      syscall
%endmacro

%macro      sys.ioprioSet           3
      mov   rax,  251
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.ioprioGet           2
      mov   rax,  252
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.inotifyInit         0
      mov   rax,  253
      syscall
%endmacro

%macro      sys.inotifyAddWatch     3
      mov   rax,  254
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.inotifyRmWatch      2
      mov   rax,  255
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.migratePages        4
      mov   rax,  256
      mov   rdi,  %1
      mov   rsi,  %2    ;           unsigned    long        maxnode
      mov   rdx,  %3    ; const     unsigned    long        *old_nodes
      mov   r10,  %4    ; const     unsigned    long        *new_nodes
      syscall
%endmacro

%macro      sys.openat              4
      mov   rax,  257
      mov   rdi,  %1
      mov   rsi,  %2    ; const                 char        *filename
      mov   rdx,  %3    ;                       int         flags
      mov   r10,  %4    ;                       int         mode
      syscall
%endmacro

%macro      sys.mkdirat             3
      mov   rax,  258
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;                       int         mode
      syscall
%endmacro

%macro      sys.mknodat             4
      mov   rax,  259
      mov   rdi,  %1
      mov   rsi,  %2    ; const                 char        *filename
      mov   rdx,  %3    ;                       int         mode
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.fchownat            5
      mov   rax,  260
      mov   rdi,  %1
      mov   rsi,  %2    ; const                 char        *filename
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5
      syscall
%endmacro

%macro      sys.futimesat           3
      mov   rax,  261
      mov   rdi,  %1
      mov   rsi,  %2    ; const                 char        *filename
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.newfstatat          4
      mov   rax,  262
      mov   rdi,  %1
      mov   rsi,  %2    ; const                 char        *filename
      mov   rdx,  %3    ;           struct      stat        *statbuf
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.unlinkat            3
      mov   rax,  263
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.renameat            4
      mov   rax,  264
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.linkat              5
      mov   rax,  265
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5    ;                       int         flags
      syscall
%endmacro

%macro      sys.symlinkat           3
      mov   rax,  266
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.readlinkat          4
      mov   rax,  267
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;                       char        *buf
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.fchmodat            3
      mov   rax,  268
      mov   rdi,  %1
      mov   rsi,  %2    ; const                 char        *filename
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.faccessat           3
      mov   rax,  269
      mov   rdi,  %1
      mov   rsi,  %2    ; const                 char        *filename
      mov   rdx,  %3    ;                       int         mode
      syscall
%endmacro

%macro      sys.pselect6            6
      mov   rax,  270
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5
      mov   r9,   %6
      syscall
%endmacro

%macro      sys.ppoll               5
      mov   rax,  271
      mov   rdi,  %1
      mov   rsi,  %2    ;           unsigned    int         nfds
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5    ;                       size_t      sigsetsize
      syscall
%endmacro

%macro      sys.unshare             1
      mov   rax,  272
      mov   rdi,  %1    ;           unsigned    long        unshare_flags
      syscall
%endmacro

%macro      sys.setRobustList       2
      mov   rax,  273
      mov   rdi,  %1
      mov   rsi,  %2    ;                       size_t      len
      syscall
%endmacro

%macro      sys.getRobusList        3
      mov   rax,  274
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;                       size_t      *len_ptr
      syscall
%endmacro

%macro      sys.splice              6
      mov   rax,  275
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5    ;                       size_t      len
      mov   r9,   %6    ;           unsigned    int         flags
      syscall
%endmacro

%macro      sys.tee                 4
      mov   rax,  276
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;                       size_t      len
      mov   r10,  %4    ;           unsigned    int         flags
      syscall
%endmacro

%macro      sys.syncFileRannge      4
      mov   rax,  277
      mov   rdi,  %1
      mov   rsi,  %2    ;                       loff_t      offset
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.vmsplice            4
      mov   rax,  278
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    long        nr_segs
      mov   r10,  %4    ;           unsigned    int         flags
      syscall
%endmacro

%macro      sys.movePages           6
      mov   rax,  279
      mov   rdi,  %1
      mov   rsi,  %2    ;           unsigned    long        nr_pages
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5
      mov   r9,   %6    ;                       int         flags
      syscall
%endmacro

%macro      sys.utimensat           4
      mov   rax,  280
      mov   rdi,  %1
      mov   rsi,  %2    ; const                 char        *filename
      mov   rdx,  %3
      mov   r10,  %4    ;                       int         flags
      syscall
%endmacro

%macro      sys.epollPwait          6
      mov   rax,  281
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5
      mov   r9,   %6    ;                       size_t      sigsetsize
      syscall
%endmacro

%macro      sys.signalfd            3
      mov   rax,  282
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;                       size_t      sizemask
      syscall
%endmacro

%macro      sys.timerfdCreate       2
      mov   rax,  283
      mov   rdi,  %1
      mov   rsi,  %2    ;                       int         flags
      syscall
%endmacro

%macro      sys.eventfd             1
      mov   rax,  284
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.fallocate           4
      mov   rax,  285
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;                       loff_t      offset
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.timerfdSettime      4
      mov   rax,  286
      mov   rdi,  %1
      mov   rsi,  %2    ;                       int         flags
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.timerfdGettime      2
      mov   rax,  287
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.accept4             4
      mov   rax,  288
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4    ;                       int         flags
      syscall
%endmacro

%macro      sys.signalfd4           4
      mov   rax,  289
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;                       size_t      sizemask
      mov   r10,  %4    ;                       int         flags
      syscall
%endmacro

%macro      sys.eventfd2            2
      mov   rax,  290
      mov   rdi,  %1
      mov   rsi,  %2    ;                       int         flags
      syscall
%endmacro

%macro      sys.epollCreate1        1
      mov   rax,  291
      mov   rdi,  %1    ;                       int         flags
      syscall
%endmacro

%macro      sys.dup3                3
      mov   rax,  292
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.pipe2               2
      mov   rax,  293
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.inotifyInit1        1
      mov   rax,  294
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.preadv              5
      mov   rax,  295
      mov   rdi,  %1    ;           unsigned    long        fd
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    long        vlen
      mov   r10,  %4    ;           unsigned    long        pos_l
      mov   r8,   %5    ;           unsigned    long        pos_h
      syscall
%endmacro

%macro      sys.pwritev             5
      mov   rax,  296
      mov   rdi,  %1    ;           unsigned    long        fd
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    long        vlen
      mov   r10,  %4    ;           unsigned    long        pos_l
      mov   r8,   %5    ;           unsigned    long        pos_h
      syscall
%endmacro

%macro      sys.rtTgsigqueueinfo    4
      mov   rax,  297
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.perfEventOpen       5
      mov   rax,  298
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5    ;           unsigned    long        flags
      syscall
%endmacro

%macro      sys.recvmmsg            5
      mov   rax,  299
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4    ;           unsigned    int         flags
      mov   r8,   %5
      syscall
%endmacro

%macro      sys.fanotifyInit        2
      mov   rax,  300
      mov   rdi,  %1    ;           unsigned    int         flags
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.fanotifyMark        5
      mov   rax,  301
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5
      syscall
%endmacro

%macro      sys.prlimit64           4
      mov   rax,  302
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.nameToHandleAt      4
      mov   rax,  303
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

%macro      sys.openByHandleAt      4
      mov   rax,  304
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4    ;                       int         flags
      syscall
%endmacro

%macro      sys.clockAdjtime        2
      mov   rax,  305
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.syncfs              1
      mov   rax,  306
      mov   rdi,  %1
      syscall
%endmacro

%macro      sys.sendmmsg            4
      mov   rax,  307
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4    ;           unsigned    int         flags
      syscall
%endmacro

%macro      sys.setns               2
      mov   rax,  308
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.getcpu              3
      mov   rax,  309
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.processVmReadv      6
      mov   rax,  310
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    long        liovcnt
      mov   r10,  %4
      mov   r8,   %5    ;           unsigned    long        riovcnt
      mov   r9,   %6    ;           unsigned    long        flags
      syscall
%endmacro

%macro      sys.processVmWritev     6
      mov   rax,  311
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    long        liovcnt
      mov   r10,  %4
      mov   r8,   %5    ;           unsigned    long        riovcnt
      mov   r9,   %6    ;           unsigned    long        flags
      syscall
%endmacro

%macro      sys.kcmp                5
      mov   rax,  312
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4    ;           unsigned    long        idx1
      mov   r8,   %5    ;           unsigned    long        idx2
      syscall
%endmacro

%macro      sys.finitModule         3
      mov   rax,  313
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;                       int         flags
      syscall
%endmacro

%macro      sys.schedSetattr        3
      mov   rax,  314
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    int         flags
      syscall
%endmacro

%macro      sys.schedGetattr        4
      mov   rax,  315
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4    ;           unsigned    int         flags
      syscall
%endmacro

%macro      sys.renameat2           5
      mov   rax,  316
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5    ;           unsigned    int         flags
      syscall
%endmacro

%macro      sys.seccomp             3
      mov   rax,  317
      mov   rdi,  %1
      mov   rsi,  %2    ;           unsigned    int         flags
      mov   rdx,  %3
      syscall
%endmacro

%macro      sys.getrandom           3
      mov   rax,  318
      mov   rdi,  %1
      mov   rsi,  %2    ;                       size_t      count
      mov   rdx,  %3    ;           unsigned    int         flags
      syscall
%endmacro

%macro      sys.memfdCreate         2
      mov   rax,  319
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

%macro      sys.kexecFileLoad       5
      mov   rax,  320
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    long        cmdline_len
      mov   r10,  %4
      mov   r8,   %5    ;           unsigned    long        flags
      syscall
%endmacro

%macro      sys.bpf                 3
      mov   rax,  321
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      syscall
%endmacro

%macro      stub.execveat           5
      mov   rax,  322
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5    ;                       int         flags
      syscall
%endmacro

%macro      userfaultfd             1
      mov   rax,  323
      mov   rdi,  %1    ;                       int         flags
      syscall
%endmacro

%macro      membarrier              2
      mov   rax,  324
      mov   rdi,  %1
      mov   rsi,  %2    ;                       int         flags
      syscall
%endmacro

%macro      mlock2                  3
      mov   rax,  325
      mov   rdi,  %1    ;           unsigned    long        start
      mov   rsi,  %2    ;                       size_t      len
      mov   rdx,  %3    ;                       int         flags
      syscall
%endmacro

%macro      copyFileRange           6
      mov   rax,  326
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5    ;                       size_t      len
      mov   r9,   %6    ;           unsigned    int         flags
      syscall
%endmacro

%macro      preadv2                 6
      mov   rax,  327
      mov   rdi,  %1    ;           unsigned    long        fd
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    long        vlen
      mov   r10,  %4    ;           unsigned    long        pos_l
      mov   r8,   %5    ;           unsigned    long        pos_h
      mov   r9,   %6    ;                       int         flags
      syscall
%endmacro

%macro      pwritev2                6
      mov   rax,  328
      mov   rdi,  %1    ;           unsigned    long        fd
      mov   rsi,  %2
      mov   rdx,  %3    ;           unsigned    long        vlen
      mov   r10,  %4    ;           unsigned    long        pos_l
      mov   r8,   %5    ;           unsigned    long        pos_h
      mov   r9,   %6    ;                       int         flags
      syscall
%endmacro

; int
; pkey_mprotect(unsigned      long        start,
;                             size_t      len,
;               unsigned      long        prot,
;                             int         pkey)
%macro      sys.pkeyMprotect        4
      mov   rax,  329
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      syscall
%endmacro

; int
; pkey_alloc(unsigned   long  flags,
;            unsigned   long  init_access_rights)
%macro      sys.pkeyAlloc           2
      mov   rax,  330
      mov   rdi,  %1
      mov   rsi,  %2
      syscall
%endmacro

; int
; pkey_free(int   pkey)
%macro      sys.pkeyFree            1
      mov   rax,  331
      mov   rdi,  %1
      syscall
%endmacro

; int
; sys_statx
%macro      sys.statx               5
      mov   rax,  332
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5
      syscall
%endmacro

%macro      sys.ioPgetevents        6
      mov   rax,  333
      mov   rdi,  %1
      mov   rsi,  %2
      mov   rdx,  %3
      mov   r10,  %4
      mov   r8,   %5
      mov   r9,   %6
      syscall
%endmacro

; I could not find this anywhere, and the only place that I did find it, it
; showed that it had 7 parameters.
;%macro      sys.rseq
;      mov   rax,  334
;      syscall
;%endmacro
