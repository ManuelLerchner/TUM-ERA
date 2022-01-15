%include "io.inc"

section .data
    glueckszahl: DD 7
    alternative: DD 5
    sicherheitscode: DB 1
    maske: DD 0xffffff
    ergebniss: DQ 0
    lottozahlen: DD 6,6,3,2,6,7
    zeiger: DD 1
    
section .bss
    vorname: RESB 64
    data: RESQ 64
 

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    NEWLINE
    PRINT_STRING "glueckszahl: "
    PRINT_DEC 4, [glueckszahl]
    
    NEWLINE
    PRINT_STRING "alternative: "
    PRINT_DEC 4, [alternative]
    
    ; Exchange variables
    MOV eax,[glueckszahl]
    XCHG eax,[alternative]
    XCHG eax,[glueckszahl]
    
    NEWLINE
    
    NEWLINE
    PRINT_STRING "glueckszahl swp: "
    PRINT_DEC 4, [glueckszahl]
    
    NEWLINE
    PRINT_STRING "alternative swp: "
    PRINT_DEC 4, [alternative]
    
    NEWLINE
    
    NEWLINE
    PRINT_STRING "glueckszahl: "
    PRINT_DEC 4, [glueckszahl]
    
    ; Programm
    mov eax,0
    MOV al,[sicherheitscode]
    add eax,[glueckszahl]
    
    NEWLINE
    PRINT_STRING "ergebniss: "
    PRINT_DEC 4, eax
    
     NEWLINE
    
    mov DWORD [ergebniss],eax
    MOV DWORD [ergebniss+4],42
    
    NEWLINE
    PRINT_STRING "ergebniss lower: "
    PRINT_DEC 4, [ergebniss]
    
    NEWLINE
    PRINT_STRING "ergebniss higher: "
    PRINT_DEC 4, [ergebniss+4]
    
    
    
    
    ;; Zeichenketten
    
    MOV ebx,data
    mov ecx,5
    
    MOV DWORD [EBX+320], 5
    MOV DWORD [EBX+384], 8
    
    NEWLINE
    
    NEWLINE
    PRINT_STRING "Data[5] higher: "
    PRINT_DEC 4, [EBX+320]
    NEWLINE
    PRINT_STRING "Data[6] higher: "
    PRINT_DEC 4, [EBX+384]
    
  
    
    ;calc ecxth adress
    mov eax,64
    mul ecx
    mov edx,eax
    
    MOV eax,[EBX+EDX]
    XCHG QWORD eax,[EBX+EDX+64]
    XCHG QWORD eax,[EBX+EDX]
    
    NEWLINE
    
     NEWLINE
    PRINT_STRING "Data[5] higher swp: "
    PRINT_DEC 4, [EBX+320]
    NEWLINE
    PRINT_STRING "Data[6] higher swp: "
    PRINT_DEC 4, [EBX+384]
    
    
    
    ret