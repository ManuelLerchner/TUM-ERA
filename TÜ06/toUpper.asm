%include "io.inc"

section .data
string: db "Hallo welt",0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    mov eax,string
    
    PRINT_STRING [eax]
     NEWLINE
    call toUpper
    
    
    
    NEWLINE
    PRINT_STRING [eax]
    
    
    ret
    
    
    
toUpper:
    push eax
    
  
    mov ecx,-1
    mov edi,eax
    mov al,0
    
    repne scasb
    
    add ecx,2
    neg ecx
    
    pop eax
    
    
    mov edi,0
    jmp compare
    
loop:

    mov dl,[eax+edi]
    
    cmp dl,"a"
    jnc subtract
    
    jmp end
    
subtract:
    sub dl,32
    mov [eax+edi],dl
    


end:

    inc edi
compare:
    cmp edi,ecx
    jl loop
    


    ret 