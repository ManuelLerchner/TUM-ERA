%include "io.inc"

section .data
data: db 49,49,52,50,32

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    mov edi,data
    PRINT_DEC 4,edi
    NEWLINE
    
    call atoi
    
    PRINT_DEC 4,eax
    NEWLINE
    PRINT_DEC 4,edi
    ret
    
    
atoi:
    push ebx
    push ecx
    push edx
    
    mov ecx,0
    
    loop:
    
    mov dl,[edi+ecx]
    
    cmp dl,48
    jl notValid
    
    cmp dl,57
    jg notValid
    

    inc ecx
    jmp loop
    
    
notValid:

    push ecx
    
    dec ecx
    
    mov eax,0
    mov ebx,1
        
    jmp comparison
    
    loop2:
    mov edx,0
    mov dl,[edi+ecx]
    sub edx,48
    
    imul edx,ebx
    
    add eax,edx
    
    imul ebx,10
    

    dec ecx
comparison:
    cmp ecx,0
    jge loop2
    
    pop ecx
    add edi,ecx
    
   
    pop edx
    pop ecx
    pop ebx
  
    
    ret