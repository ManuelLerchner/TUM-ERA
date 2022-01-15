%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    
    
    mov eax,-23
    
    call absolut
    
    PRINT_DEC 4,eax
    ret
    

absolut:

    cmp eax,0
    jl negate
    
    ret
    
negate:
    imul eax,-1
    ret