global _start

%define _SYS_EXIT 60

section .text

_start:
  mov rbp, rsp

  sub rsp, 16
  mov dword [rbp - 8], 0x11111111
  mov dword [rbp - 16], 0x22222222
  
  call _func
  
  mov dword [rbp - 8], 0x33333333
  
  mov rsp, rbp
  jmp _exit

_exit:
  mov rax, _SYS_EXIT
  xor rdi, rdi
  syscall
  
_func:
  push rbp
  mov rbp, rsp
  
  sub rsp, 16
  mov dword [rbp - 8], 0x44444444
  
  mov rsp, rbp
  pop rbp
  ; leave ; dose the same thing
  ret
