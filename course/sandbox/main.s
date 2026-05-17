bits 64
global _start

section .data
s1 db "Hello, World!", 0
s2 db 14 dup(0)

section .text

; char *ft_strcpy(char *dst, const char *src);
_start:

  mov rdi, s2
  mov rsi, s1
  call _ft_strcpy
  jmp _exit

_ft_strcpy:
  xor rcx, rcx

  .loop:
    mov dl, [rsi + rcx]
    cmp dl, 0
    jz .end
    mov [rdi + rcx], dl
    inc rcx
    jmp .loop

  .end:
    mov rax, rdi
    ret

%define _SYS_EXIT 60
_exit:
  mov rax, _SYS_EXIT
  xor rdi, rdi
  syscall
