; {
; 	int	i;
; 	int	sign;
; 	int	nb;
;
; 	i = 0;
; 	sign = 1;
; 	nb = 0;

; 	while (nptr[i] && (nptr[i] == 32 || (nptr[i] >= 9 && nptr[i] <= 13)))
; 		i++;

; 	if (nptr[i] == '+' && nptr[i + 1] != '-')
; 		i++;
; 	else if (nptr[i] && (nptr[i] == '-'))
; 	{
; 		if (nptr[i] == '-')
; 			sign = -1;
; 		i++;
; 	}
;
; 	while (nptr[i] && nptr[i] >= '0' && nptr[i] <= '9')
; 	{
; 		nb = nb * 10 + (nptr[i] - '0');
; 		i++;
; 	}
;
; 	return (nb * sign);
; }

extern ft_isspace
extern ft_isdigit

%define NPTR 0
%define NB 8
%define SIGN 16

global ft_atoi

section .text

ft_atoi:

  sub rsp, 24
  mov [rsp + NPTR], rdi
  mov qword [rsp + NB], 0
  mov qword [rsp + SIGN], 1
  xor rcx, rcx

  .loop_white_space:
    mov rsi, [rsp + NPTR]
    movzx edi, byte [rsi + rcx]
    test edi, edi
    jz .post_ws

    call ft_isspace
    test eax, eax
    jz .post_ws

    inc rcx
  jmp .loop_white_space

  .post_ws:
    mov rsi, [rsp + NPTR]
    movzx eax, byte [rsi + rcx]

    cmp al, '+'
    je .plus
    cmp al, '-'
    je .minus
    jmp .parse_digits


  .plus:
    movzx edx, byte [rsi +rcx + 1]
    cmp dl, '-'
    je .parse_digits
    inc rcx
    jmp .parse_digits

  .minus:
    mov qword [rsp + SIGN], -1
    inc rcx
    jmp .parse_digits


  .parse_digits:
    mov rsi, [rsp + NPTR]

  .loop_digit:

    movzx edi, byte [rsi + rcx]
    test edi, edi
    jz .done

    call ft_isdigit
    test eax, eax
    jz .done

    mov rax, [rsp + NB]
    imul rax, rax, 10
    movzx rdx, byte [rsi + rcx]
    sub rdx, '0'
    add rax, rdx
    mov [rsp + NB], rax

    inc rcx
    jmp .loop_digit

  .done:
    mov rax, [rsp + NB]
    mov rdx, [rsp + SIGN]
    imul rax, rdx

  add rsp, 24
  ret

  ; sub rsp, 24
  ; mov [rsp + NPTR], rdi
  ; mov [rsp + NB], 0
  ; mov [rsp + SIGN], 1
  ;
  ; xor rcx, rcx
  ;
  ; .loop_whitespace:
  ;   mov rax, [rsp + NPTR]
  ;   movzx edi, byte [rax + rcx]
  ;   test edi, edi
  ;   jz .end_loop_whitespace
  ;
  ;   call ft_isspace
  ;   test eax, eax
  ;   jz .end_loop_whitespace
  ;
  ;   inc rcx
  ;   jmp .loop_whitespace
  ;
  ; .end_loop_whitespace:
  ;   mov rax, [rsp + NPTR]
  ;   cmp al, '+'
  ;   mov rbx, rax
  ;
  ;   mov rax, [rsp + NPTR + 1]
  ;   cmp al '-'
  ;   and rbx, rax
  ;   jz .check_minus
  ;   inc rcx
  ;
  ; .check_minus:
  ;   mov rax, [rsp + NPTR]
  ;   test al, al
  ;   jz .loop_num
  ;
  ;   cmp al, '-'
  ;   jz .loop_num
  ;   mov [rsp + SIGN], -1
  ;   inc rcx
  ;
  ;
  ; .loop_num:
  ;   mov rax, [rsp + NPTR]
  ;   movzx edi, byte [rax + rcx]
  ;   test edi, edi
  ;   jz .end
  ;
  ;   call ft_isdigit
  ;   test eax, eax
  ;   jz .end
  ;
  ;   mov rax, [rsp + NB]
  ;   mul rax, 10
  ;   mov rdx, rax
  ;   mov rax, [rsp + NPTR]
  ;   mov rax, byte [rax + rcx]
  ;   sub rax, '\0'
  ;   inc rcx
  ;   jmp loop_num
  ;
  ; .end:
  ;   mov rax, [rsp + NB]
  ;   mul rax, [rsp + SIGN]
  ;   ret
  ;
