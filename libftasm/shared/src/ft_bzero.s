; void	ft_bzero(void *ptr, size_t n)
ft_bzero:

  test rsi, rsi
  jz .done

  xor rax, rax
  mov rcx, rsi
  shr rcx, 3
  rep stosq

  and rsi, 7
  jz .done

  .loop_bytes:
    mov byte [rdi], 0
    inc rdi
    dec rsi
    jnz .loop_bytes

  .done:
  ret
