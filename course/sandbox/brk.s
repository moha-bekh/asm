bits 64
global _start
section .text

%define _SYS_BRK 12
_start:
  mov rax, _SYS_BRK
  mov rdi, 0
  syscall

  nop
  mov qword [buf], rax
  nop

  add rax, 1024
  mov rdi, rax
  mov rax, _SYS_BRK
  syscall
	
  nop

  mov rax, [buf]
  mov rbx, 0x1234
  mov [rax], rbx

  nop

  mov rax, _SYS_BRK
  mov rdi, [buf]
  syscall

	jmp _exit

%define _SYS_EXIT 60
_exit:
  mov rax, _SYS_EXIT
  xor rdi, rdi
  syscall

section .data
buf: dq 0x00
