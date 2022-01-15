%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    mov eax,2
    mov ebx,23
    mov ecx,256
    mov edx,27
    
    push 5
    push 0 ; rückgabe
    
    call factorial
       
    pop eax ; rückgabe
    pop ebx

    
    PRINT_DEC 4,edx    
    
    ret
    
    
    
factorial:
    push ebp
    mov ebp,esp
    
    push eax
    push ebx
    push edx
    
    mov eax,[ebp+12]
    call factorial_step
    
    mov [ebp+8],eax
    
    pop edx
    pop ebx
    pop eax
    
    pop ebp
    ret
    
    
factorial_step:

    cmp eax,0
    je factorial_base_case
    
    
    push eax
    
    dec eax
    call factorial_step
    
    mov ebx,eax
    
    pop eax
    
    mul ebx
    

    ret
    
factorial_base_case:
    mov eax,1
    ret
