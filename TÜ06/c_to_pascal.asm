%include "io.inc"

section .data
cString: db "Hallo",0

section .bss
length:resb 1 
pascalString: resb 255

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    
    xor eax, eax
    
    mov eax,cString
    mov ebx,pascalString
    
    call c2p
    
    
    PRINT_STRING cString
    NEWLINE
    PRINT_STRING pascalString
    NEWLINE
    
    ret
    
c2p:

    push eax
    
    mov edi,eax

    mov al,0
    mov cl,-1
    
    repne scasb
    
    add cl,2
    neg cl
    
    mov [length],cl
    
    pop eax
    
    
    
    mov ecx,0
    mov cl,[length]
    
    mov edi,ebx
    mov esi,eax
    
    rep movsb
    
    
    ret