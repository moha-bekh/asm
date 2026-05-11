; int ft_isprint(int c);
global ft_isprint

section .text

ft_isprint:

  mov eax, edi
  sub eax, 32
  test eax, eax
  setl al
  movzx eax, al
  xor eax, 1

  mov ebx, edi
  sub ebx, 126
  test ebx, ebx
  setle bl
  movzx ebx, bl

  and eax, ebx
  ret
