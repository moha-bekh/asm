bits 64
global _start

section .data
s1 db "Hello, World!", 0
l1 equ $-s1
s2 db "Hello, la terre!", 0

section .text

// char *ft_strdup(const char *s);

_start:
  mov rdi, s1
  call ft_strcup
  jmp _exit

%define _SYS_EXIT 60
_exit:
  mov rax, _SYS_EXIT
  xor rdi, rdi
  syscall
