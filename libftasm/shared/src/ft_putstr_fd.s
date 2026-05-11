%define SYS_WRITE 1

extern ft_strlen

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
