; int	ft_atoi(const char *nptr)

%define NPTR 0x0
%define NB 0x8
%define SIGN 0x10

global ft_atoi

section .text

ft_atoi:

  sub rsp, 0x18
  mov [rsp + NPTR], rdi
  mov qword [rsp + NB], 0x0
  mov qword [rsp + SIGN], 0x1
  xor ecx, ecx

  
  .loop_ws:

    mov rsi, [rsp + NPTR]
    movzx edx, byte [rsi + rcx]

    cmp dl, 0x0
    jz .end_loop_ws
    
    cmp dl, 0x20
    sete al
    movzx eax, al
    
    cmp dl, 0x9
    setae bl
    movzx ebx, bl
    
    cmp dl, 0x13
    setle dl
    movzx edx, dl
    
    and ebx, edx
    or eax, ebx
    jz .end_loop_ws
    
    inc ecx
    jmp .loop_ws
    
  .end_loop_ws:

  mov rsi, [rsp + NPTR]
  movzx edx, byte [rsi + rcx]

  cmp edx, 0x2b
  sete al
  movzx eax, al

  movzx edx, byte [rsi + rcx + 0x1]
  cmp edx, 0x2d
  setne bl
  movzx ebx, bl

  and eax, ebx
  jz .check_minus
  inc ecx

  .check_minus:

    movzx edx, byte [rsi + rcx]
    cmp edx, 0x2d
    jnz .loop_num
    mov qword [rsp + SIGN], -0x1
    inc ecx

  .loop_num:
    
    movzx edx, byte [rsi + rcx]
    cmp edx, 0x0
    jz .end_loop_num

    cmp edx, 0x30
    setae al
    movzx eax, al

    cmp edx, 0x39
    setbe bl
    movzx ebx, bl

    and eax, ebx
    jz .end_loop_num

    mov eax, [rsp + NB]
    imul eax, 10
    mov ebx, eax

    movzx eax, byte [rsi + rcx]
    sub eax, 0x30
    add eax, ebx
    mov [rsp + NB], eax

    inc ecx
    jmp .loop_num

  
  .end_loop_num:

    mov eax, [rsp + NB]
    mov ebx, [rsp + SIGN]
    imul eax, ebx
    add rsp, 0x18
    ret
