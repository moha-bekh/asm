global ft_strlen

section .text

; size_t ft_strlen(const char *s);
ft_strlen:
  xor rax, rax

  .loop:
		cmp byte [rdi + rax], 0
		je .end
    inc rax
    jmp .loop

  .end:
    ret
