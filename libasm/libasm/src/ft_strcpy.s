global ft_strcpy

section .text

; char *ft_strcpy(char *dst, const char *src);
ft_strcpy:
	mov rax, rdi

  .loop:
    mov dl, [rsi]
		mov [rdi], dl
    inc rsi
    inc rdi
			test dl, dl
			jnz .loop
	    ret

section .note.GNU-stack noalloc noexec nowrite progbits
