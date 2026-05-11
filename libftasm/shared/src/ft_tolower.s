; int	ft_tolower(int c)
global ft_tolower

section .text

ft_tolower:

  mov eax, edi

  mov ecx, eax
  sub ecx, 65
  cmp ecx, 25
  setbe cl
  movzx ecx, cl
  shl ecx, 5

  add eax, ecx
  ret
