global ft_strcmp

section .text

; int ft_strcmp(const char *s1, const char *s2);
ft_strcmp:
  xor rcx, rcx

  .loop:
    movzx eax, byte [rdi + rcx]
    movzx edx, byte [rsi + rcx]
    cmp al, dl
    jne .not_equal
    test al, al
    jz .end
    inc rcx
    jmp .loop

  .not_equal:
    sub eax, edx

  .end:
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
