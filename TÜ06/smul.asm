%include "io.inc"

section .data
a: dd 1,2,2,0,1
b: dd 1,3,-2,0,1
section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    mov eax,a
    mov ebx,b
    mov ecx,5
    
    call smul
    
    PRINT_DEC 4,eax
    ret
    

smul:
    mov edx,0
    mov esi,0 ; counter
    jmp comparison
    
loop:

    push eax
    push ebx
    
    mov eax,[eax+esi*4]
    mov ebx,[ebx+esi*4]
    imul eax,ebx
    add edx,eax
    
    pop ebx
    pop eax
    
    inc esi
    
comparison:
    cmp esi,ecx
    jl loop

    mov eax,edx
    ret
    
    