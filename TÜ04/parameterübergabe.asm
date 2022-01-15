%include "io.inc"

section .bss
    par1: resd 1
    par2: resd 1
    par3: resd 1
    par4: resd 1

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    
    mov eax,1
    mov ebx,8
    mov ecx,5
    mov edx,10
    
    call add_registers
    
    PRINT_DEC 4,eax
    
    NEWLINE
    
    mov dword [par1],1
    mov dword [par2],2
    mov dword [par3],5
    mov dword [par4],102
    
            
    call add_global_location
    
    PRINT_DEC 4,eax
    NEWLINE
    
    
    push 1
    push 26
    push 5
    push 10
   
    call add_stack
    
    add esp,4*4
    
    PRINT_DEC 4,eax
    NEWLINE
    
    ret
    
add_registers:
    add eax,ebx
    add eax,ecx
    add eax,edx
    ret
    
add_global_location:
    mov eax,[par1]
    add eax,[par2]
    add eax,[par3]
    add eax,[par4]
    ret
    
    
add_stack:
    push ebp
    mov ebp,esp
    
    mov eax,[ebp+8]
    add eax,[ebp+12]
    add eax,[ebp+16]
    add eax,[ebp+20]
    
    pop ebp
    ret
    
    