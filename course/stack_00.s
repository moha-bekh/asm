bits 64

global _start

%define _STACK_SIZE 4096

%define _SYS_WRITE 1
%define _SYS_EXIT 60

section .text

_start:
  
  call hello
  jmp exit
  
  ; manual call stack handling
  mov rsp, stack
  lea rsp, [stack]
  
  lea rax, end
  mov [rsp], rax
  add rsp, 8
  
  jmp hello
  
end:
  jmp exit

exit:
  mov rax, _SYS_EXIT
  xor rdi, rdi
  syscall

hello:

  mov rax, _SYS_WRITE
  mov rdi, 1
  mov rsi, s1
  mov rdx, l1
  syscall
  
  call space
  ret
  
  lea rax, world
  mov [rsp], rax
  add rsp, 8
  
  jmp space

world:

  mov rax, _SYS_WRITE
  mov rdi, 1
  mov rsi, s2
  mov rdx, l2
  syscall
  
  ret
  
  sub rsp, 8
  jmp [rsp]
  
space:

  mov rax, _SYS_WRITE
  mov rdi, 1
  mov rsi, l3
  mov rdx, 1
  syscall
  
  call world
  ret

  sub rsp, 8
  jmp [rsp]

section .data

s1 db "Hello"
l1 equ $-s1
s2 db "world!"
l2 equ $-s2
l3 db " "

stack: times _STACK_SIZE db 0xaa
stack_end:

