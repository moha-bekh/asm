; int	ft_toupper(int c)
global ft_toupper

extern ft_isalpha

section .text

ft_toupper:

  mov eax, edi

  mov ecx, eax
  sub ecx, 97
  cmp ecx, 25
  setbe cl
  movzx ecx, cl
  shl ecx, 5

  xor eax, ecx
  ret

; ft_toupper:
;
;   sub rsp, 8
;   mov [rsp], rdi
;
;   call ft_isalpha
;   test eax, eax
;   jz .not_alpha
;
;   mov rax, [rsp]
;   add rsp, 8
;   btr rax, 0b00000101
;   ret
;
;   .not_alpha:
;   mov rax, [rsp]
;   add rsp, 8
;
;   ret
