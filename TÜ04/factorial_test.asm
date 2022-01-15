%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    mov eax,6
    
    call factorial
    
    PRINT_DEC 4,eax

    
    ret
    
    
    
factorial:
    push edx
    call factorial_step
    mov eax,edx
    pop edx
    ret
    
    
factorial_step:
    cmp eax,0
    je  factorial_base_case
    
    push eax
    
    dec eax
    call factorial_step
    
    pop eax
    
    imul edx,eax
    
    ret
    
    
factorial_base_case:
    mov edx,1
    ret