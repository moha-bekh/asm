; size_t ft_strlen(const char *s);
global ft_strlen

section .text

ft_strlen:
  xor rcx, rcx

  .loop:
    mov al, byte [rdi + rcx]
    test al, al
    jz .end
    inc rcx
    jmp .loop

  .end:
    mov rax, rcx
    ret

