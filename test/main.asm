bits 64

%define _SYS_EXIT 60
%define _SYS_WRITE 1
%define _SYS_MMAP 9
%define _SYS_UNMMAP 11

%define _NEW_LINE 10
%define _NULL 0

%define _STDIN 0
%define _STDOUT 1
%define _STDERR 2

global _start

section .data

section .text

    _start:

        mov rax, 10
        add rax, 20

    _exit:

        mov rax, _SYS_EXIT
        xor rdi, rdi
        syscall