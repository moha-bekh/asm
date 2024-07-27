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

    msg_1 db "Hello world!", _NEW_LINE, _NULL
    len_1 equ $-msg_1

section .bss

    addr resq 1

section .text

        _alloc:
            
            push rbp
            mov rbp, rsp
            sub rsp, 8

            mov [rbp - 8], rdi

            mov rax, _SYS_MMAP
            xor rdi, rdi
            mov rsi, [rbp - 8]
            mov rdx, 7
            mov r10, 50
            mov r8, -1
            xor r9, r9
            syscall

            add rsp, 8
            mov rsp, rbp
            pop rbp
            ret

        _free:
            cmp rdi, 0
            jz _free_exit
            mov rax, _SYS_UNMMAP
            syscall
            ret

        _free_exit:
            xor rax, rax
            ret

    _start:

        sub rsp, 8

        mov rdi, len_1
        call _alloc
        mov [addr], rax

        xor rcx, rcx

        _loop:

            mov al, [msg_1 + rcx]
            cmp al, 0
            jz _end_loop
            mov [addr + rcx], al
            inc rcx
            jmp _loop
        
        _end_loop:

        mov rax, _SYS_WRITE
        mov rdi, _STDOUT
        mov rsi, addr
        mov rdx, len_1 - 1
        syscall

        mov rdi, addr
        mov rsi, len_1
        call _free

        jmp _exit

    _exit:

        add rsp, 8

        mov rax, _SYS_EXIT
        xor rdi, rdi
        syscall
