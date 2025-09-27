; bool	ft_isspace(int c);

global ft_isspace

section .text

ft_isspace:
  
  mov eax, edi
  cmp eax, 32
  sete al
  movzx eax, al

  mov ebx, edi
  cmp ebx, 9
  setae bl
  movzx ebx, bl

  cmp edi, 13
  setbe cl
  movzx ecx, cl

  and ebx, ecx

  or eax, ebx
  ret
