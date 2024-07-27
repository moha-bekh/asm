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
    malloc_fail db "malloc failed", _NEW_LINE, _NULL
    len_fail equ $-malloc_fail
    malloc_success db "malloc success", _NEW_LINE, _NULL
    len_success equ $-malloc_success

section .bss

    addr resq 1

section .text

extern malloc
extern free

    _start:

    ; sub rsp, 8

    mov rdi, len_1
    call malloc
    mov rbx, rax

    test rax, rax
    jz _exit_failure

    mov rax, _SYS_WRITE
    mov rdi, _STDOUT
    mov rsi, malloc_success
    mov rdx, len_success
    syscall

    xor rcx, rcx

    _loop:

        mov al, [msg_1 + rcx]
        test al, al
        jz _exit_loop

        mov [rbx + rcx], al
        inc rcx
        jmp _loop

    _exit_loop:

        mov rax, _SYS_WRITE
        mov rdi, _STDOUT
        mov rsi, rbx
        mov rdx, len_1
        syscall

        jmp _exit_seccess
    

    _exit_seccess:

        mov rdi, rbx
        call free

        ; add rsp, 8

        mov rax, _SYS_EXIT
        xor rdi, rdi
        syscall

    _exit_failure:

        mov rax, _SYS_WRITE
        mov rdi, _STDOUT
        mov rsi, malloc_fail
        mov rdx, len_fail
        syscall

        ; add rsp, 8

        mov rax, _SYS_EXIT
        mov rdi, 1
        syscall

    _exit:
    
        ; add rsp, 8

        mov rax, _SYS_EXIT
        xor rdi, rdi
        syscall