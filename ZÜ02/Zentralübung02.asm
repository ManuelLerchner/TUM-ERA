%include "io.inc"

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    
    ADD AX,BX ; AX := AX+BX
    ADD AX,CX ; AX := AX+CX
    ADD AX,50 ; Konstante 50 zu AX addieren
    MOV DX,AX ; Ergebnis soll in DX steh


   ;;;;;;;;
   
    mov bl,255
    and ebx,0xff
    
    mov eax,90
    neg eax
       
    
    imul ebx ; fills edx:eax
    
    mov ebx,255
    idiv ebx  ;uses edx:eax
    

   
    mov ebx,100
    add eax,ebx
    
    PRINT_DEC 4,eax
    ret
    
    
 