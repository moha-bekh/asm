global _start

%define _SYS_WRITE 1
%define _SYS_EXIT 60

section .text

_start:
  mov rdi, 123
  lea rsi, [buf + 32]
  call _itoa
  mov rdi, rax
  call _print
  call _exit

_exit:
  mov rax, _SYS_EXIT
  xor rdi, rdi
  syscall

_itoa:
  mov rbx, 10
  mov rax, rdi
  mov rdi, rsi
  mov byte [rdi], 0x0
  dec rdi
  mov byte [rdi], 0xa

_itoa_loop:
  xor rdx, rdx
  dec rdi
  div rbx
  add rdx, '0'
  mov [rdi], dl
  test rax, rax
  jne _itoa_loop
  mov rax, rdi
  ret

_print:
  push rdi
  call _strlen
  pop rsi
  mov rdx, rax
  mov rax, 1
  mov rdi, 1
  syscall
  ret

_strlen:
  push rbp
  mov rbp, rsp
  xor rcx, rcx
_strlen_loop:
  mov al, [rdi]
  cmp al, 0x0
  je _strlen_end
  inc rcx
  inc rdi
  jmp _strlen_loop
  _strlen_end:
  mov rax, rcx
  mov rsp, rbp
  pop rbp
  ret

section .data
buf: times 1024 db "_"
