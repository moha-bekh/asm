; int ft_isdigit(int c);
global ft_isdigit

section .text

ft_isdigit:
  
  mov eax, edi
  sub eax, 48
  cmp eax, 9
  setbe al
  movzx eax, al
  ret
