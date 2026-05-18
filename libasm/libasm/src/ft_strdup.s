global ft_strdup

extern malloc
extern ft_strlen

section .text

; char *ft_strdup(const char *s);
ft_strdup:
  push rbx
  mov rbx, rdi

  call ft_strlen

  inc rax
  mov rdi, rax
  call malloc wrt ..plt

  test rax, rax
  je .end

  mov rdx, rax
  xor rcx, rcx

  .loop:
    mov r8b, byte [rbx + rcx]
    mov byte [rdx + rcx], r8b
    cmp r8b, 0
    je .done
    inc rcx
    jmp .loop

  .done:
    mov rax, rdx

  .end:
    pop rbx
    ret

section .note.GNU-stack noalloc noexec nowrite progbits
