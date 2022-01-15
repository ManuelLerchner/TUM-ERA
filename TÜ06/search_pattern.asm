%include "io.inc"

section .data
data: dd 3,2,1,-1,-2
sum: dd 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    mov eax,5
    mov ebx ,data
    
    call search_pattern
    
    
    PRINT_DEC 4,[sum]
    
    ret
    
    
search_pattern:
    
    mov ecx,0
loop:
    mov edx,[ebx+ecx*4]
    
    test edx, 0x80000000
    jnz topIsOne
    
    ; top is 0
    test edx, 0x00000001
    jnz addOne
    
    jmp end
   
   
topIsOne:
    test edx, 0x00000001
    jz addOne
    
    jmp end


    
addOne:
     add DWORD [sum],1  
 
end:

    
    inc ecx    
comparison:
    cmp ecx,eax
    jl loop

    ret