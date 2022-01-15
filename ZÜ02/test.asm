%include "io.inc"

section .text
global CMAIN
CMAIN:
    ;write your code here
    xor eax, eax
    
    
    ADD AX,BX ; AX := AX+BX
    ADD AX,CX ; AX := AX+CX
    ADD AX,50 ; Konstante 50 zu AX addieren
    MOV DX,AX ; Ergebnis soll in DX steh


    mov eax,0
    mov ebx, 90
    neg ebx
    
    imul eax,ebx
    
    PRINT_DEC 4,eax
    NEWLINE
  
    
    mov ebx,255
    
    mov edx,-1
    idiv ebx
    
      PRINT_DEC 2,eax
    NEWLINE
   
    
    mov cx,100
    
    add ax,cx
    
    
    PRINT_DEC 2,ax
    ret
    
    
 