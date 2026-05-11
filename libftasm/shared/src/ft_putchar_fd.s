; void	ft_putchar_fd(char c, int fd)
global ft_putchar_fd

%define SYS_WRITE 1

section .text

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
