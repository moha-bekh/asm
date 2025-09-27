; int ft_isalpha(int c);
global ft_isalpha

section .text

ft_isalpha:

  mov eax, edi
  sub eax, 65 ; 'A' - 65 = 0
  cmp eax, 25
  setbe al
  movzx eax, al

  mov ebx, edi
  sub ebx, 97
  cmp ebx, 25
  setbe bl
  movzx ebx, bl

  or eax, ebx
  ret

  ; VERSION 1
  ; cmp rdi, 65
  ; jl .not_alpha
  ; cmp rdi, 90
  ; jle .is_alpha
  ;
  ; cmp rdi, 97
  ; jl .not_alpha
  ; cmp rdi, 122
  ; jle .is_alpha
  ;
  ; .not_alpha:
  ; xor rax, rax
  ; ret
  ;
  ; .is_alpha:
  ; mov rax, 1
  ; ret


  ; VERSION 2
  ; cmp edi, 65
  ; setl al
  ; cmp edi, 90
  ; setle bl
  ;
  ; cmp edi, 97
  ; setl cl
  ; cmp edi, 122
  ; setle dl
  ;
  ; movzx eax, al
  ; movzx ebx, bl
  ; xor eax, 1
  ; and eax, ebx
  ;
  ; movzx ecx, cl
  ; movzx edx, dl
  ; xor edx, 1
  ; and edx, ecx
  ;
  ; or eax, edx
  ; ret


  ; VERSION 3
;   mov eax, edi
;   sub eax, 65
;   cmp eax, 25
;   setbe al
;   movzx eax, al
;   test eax, eax
;   jnz .done
;
;   mov eax, edi
;   sub eax, 97
;   cmp eax, 25
;   setbe al
;   movzx eax, al
;
; done:
; ret
