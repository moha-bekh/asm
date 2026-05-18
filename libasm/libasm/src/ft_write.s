global ft_write
extern __errno_location

section .text

; ssize_t ft_write(int fd, const void *buf, size_t count);
ft_write:
  mov rax, 1
  syscall
  cmp rax, 0
  jl .error
  ret

.error:
  neg rax
  push rbx
  mov rbx, rax
  call __errno_location wrt ..plt
  mov [rax], ebx
  mov rax, -1
  pop rbx
  ret

section .note.GNU-stack noalloc noexec nowrite progbits
