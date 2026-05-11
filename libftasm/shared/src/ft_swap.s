; void	ft_swap(int *a, int *b)
global ft_swap

section .text

ft_swap:
  mov eax, [rdi]
  xchg eax, [rsi]
  mov [rdi], eax
  ret
