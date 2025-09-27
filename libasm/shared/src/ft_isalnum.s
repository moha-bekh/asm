; int ft_isalnum(int c);
global ft_isalnum

extern ft_isalpha
extern ft_isdigit

section .text

ft_isalnum:

  mov eax, edi
  call ft_isalpha
  mov ebx, eax
  mov eax, edi
  call ft_isdigit
  or eax, ebx
  ret
