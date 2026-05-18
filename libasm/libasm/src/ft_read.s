global ft_read
extern __errno_location

section .text

; ssize_t ft_read(int fd, void *buf, size_t count);
ft_read:
  mov rax, 0
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
