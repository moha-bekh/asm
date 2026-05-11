global ft_strcpy

section .text
; char *strcpy(char *dst, const char *src);

ft_strcpy:

  ; rdi - dst
  ; rsi - src
  ; rcx - i
  
  xor rcx, rcx

  mov rax, rcx
  ret

end:
