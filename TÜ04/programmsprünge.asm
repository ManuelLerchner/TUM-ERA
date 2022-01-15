%include "io.inc"


section .data
jump_table:
    dd calc_add
    dd calc_sub
    dd calc_mul
    dd calc_div


section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    mov ecx,3
    
    mov eax, 35
    mov edx, 7
    
    
    mov ebx,[jump_table+ecx*4]
    jmp ebx
    
return:
    PRINT_DEC 4,eax
    
    ret
    
    
    
calc_add:
    add eax,edx
    jmp return

calc_sub:
    sub eax,edx
    jmp return

calc_mul:
    mul edx
    jmp return

calc_div:
    push ebx
    mov ebx,edx
    mov edx,0
    div ebx
    pop ebx
    ret
    ;jmp return
