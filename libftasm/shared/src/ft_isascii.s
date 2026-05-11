; int ft_isascii(int c);
global ft_isascii

section .text

ft_isascii:

  mov eax, edi
  cmp eax, 127
  setbe al
  movzx eax, al
  ret
