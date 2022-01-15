%include "io.inc"

section .data
toFind: db 0x00,0x00,0x01
data1: db 0,4,2,4,2,0x00,0x00,0x01,23,2
indexFind: db 0


section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    mov esi,data1
    mov edx,10
    
    call find_marker
    
    
    PRINT_DEC 1,eax
    NEWLINE
    PRINT_DEC 1,[eax]
    NEWLINE
    PRINT_DEC 1,[eax+1]
    NEWLINE
    PRINT_DEC 1,[eax+2]
    ret
    
    
find_marker:
    
    mov ecx,[indexFind]
    
   
    
    mov eax,0
   
    jmp comparison 
    
    
    
    
loop1:
    mov bl,[data1+eax]
    mov cl,[toFind+0] ; fist char
    
    cmp bl,cl
    jne end
    
    mov bl,[data1+eax+1]
    mov cl,[toFind+1] ; second char
    
    cmp bl,cl
    jne end
    
    mov bl,[data1+eax+2]
    mov cl,[toFind+2] ; last char
    
    cmp bl,cl
    jne end
    
    mov ecx,data1
    add ecx,eax
    mov eax, ecx
    ret
    
    
    
end:
inc eax
    
comparison:
    cmp eax,edx
    jl loop1
    
    
    
    mov eax,-1
    
    ret
    
        
    
    
    