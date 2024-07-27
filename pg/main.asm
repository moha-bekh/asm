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

    msg_1 db "filled", _NEW_LINE, _NULL
    len_1 equ $-msg_1

    msg_2 db "empty", _NEW_LINE, _NULL
    len_2 equ $-msg_2

    _byte db 1
    _addr_byte db 1

section .bss

section .text

    _func:

        push rbp
        mov rbp, rsp
        ; sub rsp, 8 + 16

        mov rax, 10
        mov _byte, bword rax

        mov rbx, _byte
        mov rcx, [_byte]
        lea rdx, _byte
        lea rsi, [_byte]

        ; mov [rbp - 8], rdi
        ; mov [rbp - 16], rsi
        ; mov rax, [rbp - 8]
        ; add rax, [rbp - 16]

        ; add rsp, 8 + 16
        mov rsp, rbp
        pop rbp
        ret

    _start:

        sub rsp, 8

        mov rax, 10
        mov rbx, 20
        add
        ; call _func
        ; cmp rax, 0
        jz _empty
        jmp _filled

    _empty:

        mov rax, _SYS_WRITE
        mov rdi, _STDOUT
        mov rsi, msg_2
        mov rdx, len_2
        syscall
        jmp _exit

    _filled:

        mov rax, _SYS_WRITE
        mov rdi, _STDOUT
        mov rsi, msg_1
        mov rdx, len_1
        syscall
        jmp _exit

    _exit:

        add rsp, 8
        mov rax, _SYS_EXIT
        xor rdi, rdi
        syscall
