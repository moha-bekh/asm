; SYS_CALL
%define SYS_WRITE 1
%define SYS_EXIT 60
; DEVICES
%define DEV_STDOUT 1

; ENTRY_POINT
global _start

; BSS
section .bss

; DATA
section .data

hello db "Hello, World!", 10
HELLO_LEN equ $ - hello

section .text

_start:


  mov eax, SYS_EXIT
  xor edi, edi
  syscall

; void	ft_swap(int *a, int *b)
ft_swap:
  mov eax, edi
  mov edi, esi
  mov esi, eax
  ret

; void	ft_bzero(void *ptr, size_t n)
ft_bzero:

  test rsi, rsi
  jz .done

  xor rax, rax
  mov rcx, rsi
  shr rcx, 3
  rep stosq

  and rsi, 7
  jz .done

  .loop_bytes:
    mov byte [rdi], 0
    inc rdi
    dec rsi
    jnz .loop_bytes

  .done:
  ret

; void ft_putchar_fd(char c, int fd)
ft_putchar_fd:

  sub rsp, 8
  mov [rsp], rdi

  mov eax, SYS_WRITE
  mov edi, esi
  lea rsi, [rsp]
  mov edx, 1
  syscall

  add rsp, 8
  ret

; void	ft_putstr_fd(char *str, int fd)
ft_putstr_fd:

  mov rdx, rdi
  call ft_strlen

  mov r10, rax

  mov rax, SYS_WRITE
  mov rdi, rsi
  mov rsi, rdx
  mov rdx, r10
  syscall
  ret

; size_t ft_strlen(const char *str)
ft_strlen:
  xor rcx, rcx

  .loop:
    mov al, byte [rdi + rcx]
    cmp al, 0
    je .end
    inc rcx
    jmp .loop

  .end:
    mov rax, rcx
    ret

