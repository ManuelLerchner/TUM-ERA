%include "io.inc"

section .bss
    memory: resd 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    mov bx, -1
    
   
    push WORD 0
    push bx
    
    pop WORD [memory+2]
    pop WORD [memory]
    
    push DWORD [memory]
    pop eax
    
 
    PRINT_HEX 4, eax
    
    ret