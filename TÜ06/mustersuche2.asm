%include "io.inc"


section .data
pattern: db 0,1,2
string: db 1,2,5,0,0,1,2,5

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
   
    mov esi,string
    mov edx,8
    
    
    ;;;
    
    
    mov eax,0
    jmp compare
    
    loop:
    
    mov edi,pattern ; reset pattern
    mov esi,string ; reset string
    add esi, eax ;add string offset
    
    mov ecx,-1 ; reset counter
    rep cmpsb  ; eats throug esi and searches for mathcing pattern
    
   
    mov ebx,edx ;-stringlange+3
    sub ebx,3
    neg ebx  ; länge wenn compare erfolgreich
    
    
    cmp ebx,ecx ; detect if found
    je found
    
  
    inc eax
    
    compare:
    cmp eax,8
    jl loop
    
    
    ; didnt find
    mov eax,-1
    PRINT_STRING "didnt find: "
    PRINT_DEC 4,eax
    NEWLINE
    jmp end
   
found:

    PRINT_STRING "found at index: "
    PRINT_DEC 4,eax
    NEWLINE
    jmp end
    
  
end:
    ret
    
    