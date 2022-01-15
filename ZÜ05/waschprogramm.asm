%include "io.inc"


section .data
start_program:
    dd 0, 0b0001
    dd 5, 30
    dd 0, 0b0000
    dd 2, 10
    dd 0, 0b1000
    dd 1, 10
    dd 0, 0
    dd 1, 10
    dd 3, 4
    dd 6, 0
    
sprung_tabelle:
    dd AKTOR
    dd PAUSE
    dd ZAEHLER
    dd SCHLEIFE
    dd TEMPERATUR
    dd WASSERSTAND
    dd ENDE

program_counter:
    dd 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    
main_loop:
    
    call get_command
    call dispatch
    
    cmp eax,0
    je main_loop
    
    ret
    
    
get_command:
    push edx
    
    ;load program_counter
    mov edx,[program_counter]

    ;set instruction
    mov ebx,[start_program+edx]
    
    ;set paramter
    mov ecx,[start_program+edx+4]
    
    ;inc counter
    add dword [program_counter],8
    
    pop edx
    
    ret
    
dispatch:
    push edx

    cmp ebx,6
    jg ende
    
    cmp ebx,0
    jl ende
    
    call [sprung_tabelle+ebx*4]
    
    mov eax,0
    pop edx
    
    ret
    
ende:
    mov eax,1
    pop edx
    ret
    
AKTOR:
    PRINT_STRING "Aktor: "
    PRINT_DEC 4,ecx
    NEWLINE
    ret
    
PAUSE:
    PRINT_STRING "Pause: "
    PRINT_DEC 4,ecx
    NEWLINE
    ret

ZAEHLER:
    PRINT_STRING "Zähler: "
    PRINT_DEC 4,ecx
    NEWLINE
    ret

SCHLEIFE:
    PRINT_STRING "Schleife: "
    PRINT_DEC 4,ecx
    NEWLINE
    ret
 
TEMPERATUR:
    PRINT_STRING "Temperatur: "
    PRINT_DEC 4,ecx
    NEWLINE
    ret
       
WASSERSTAND:
    PRINT_STRING "Wassertsand: "
    PRINT_DEC 4,ecx
    NEWLINE
    ret
    
    
ENDE:
    PRINT_STRING "Ende "
    NEWLINE
    ret


