%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    mov eax,57
    mov ebx,3
    
    call mittelwert
    
    
    PRINT_DEC 4,eax
    ret
    
mittelwert:

    add eax,ebx
    shr eax,1
    
    ret