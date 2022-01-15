%include "io.inc"

section .data
data: dd 1,2,3,4,5,8,2

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    mov ebx,data
    mov ecx,7
    
    call revert
    ret
    
    
revert:

    
    mov edi,0
   
    jmp compare
    
    
loop:

        mov esi,ecx
        sub esi,edi 
        sub esi,1     

        mov  eax,[ebx+edi*4]
        xchg [ebx+esi*4],eax
        xchg [ebx+edi*4],eax
        
     
    
    inc edi
compare:
    push ecx
    shr ecx,1
    cmp edi,ecx
    pop ecx
    jl loop
    


    ret
    
