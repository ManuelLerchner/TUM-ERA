%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    
    mov eax,0
    mov ebx,-1
    
    mov ecx,0
    mov edx,1
    
    call add_64Bit
    
    ret
    
add_64Bit:

    add ebx,edx
    adc eax,ecx
    
    ret
