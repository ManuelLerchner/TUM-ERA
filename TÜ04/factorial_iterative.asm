%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    
    
    push 10
    push 0 ; rückgabe
    
    
    call factorial
    
    pop eax ;rückgabe
    pop ebx
    
    NEWLINE
    PRINT_DEC 4,eax
    
    
    ret
    
    
factorial:
    push ebp
    mov ebp,esp
    
    
    mov eax,1
    
    mov ecx,[ebp+12]
    
     
    call factorial_step
    mov [ebp+8],eax
    
    
    pop ebp
    
    ret
    
factorial_step:

    cmp ecx,1
    je factorial_return
    
    mul ecx
    dec ecx
    
    jmp factorial_step
    
    
factorial_return:
    ret
    
    
