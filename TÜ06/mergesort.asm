%include "io.inc"


section .data
input_array : dd 1 ,7 , 5, 12 , 0 , 2
output_array: dd 0 ,0 ,  0,  0 , 0 , 0



section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    
    
    push output_array
    push DWORD 7
    push DWORD 0
    push input_array
    
    call mergesort
    
    add esp,16
    
    
    
    ret
    
    


mergesort:

    push ebp
    mov ebp, esp

    ;save registers
    push eax
    push ebx
    push ecx
    push edx
    
   
    
    mov eax,[ebp+8] ; input array pointer
    mov ebx,[ebp+12] ; start
    mov ecx,[ebp+16] ; end
    mov edx,[ebp+20] ; output array pointer
    
    call mergesort_step
    

  

    ;restore registers
    pop edx
    pop ecx
    pop ebx
    pop eax
    
    pop ebp

    ret
    
mergesort_step:
    ;eax input array pointer
    ;ebx start
    ;ecx end
    ;edx output array pointer
    ;[ebp-4] center
    ;[ebp-8] schleifenzähler
    
    push ebp
    mov ebp,esp
    
    sub esp,8
    
    PRINT_STRING "start: "
    PRINT_DEC 4,ebx
    NEWLINE
    
    PRINT_STRING "end: "
    PRINT_DEC 4,ecx
    NEWLINE
    
    ; premature return
    push ecx
    sub ecx,ebx
    cmp ecx,1
    jle mergesort_ret  
    pop ecx
    
    ;calc center
    mov DWORD [ebp-4],ecx
    add DWORD [ebp-4],ebx
    sar DWORD [ebp-4],1
    
    PRINT_STRING "center: "
    PRINT_DEC 4,[ebp-4]
    NEWLINE
    
    
    ;recursive 1
    push output_array
    push DWORD [ebp-4]
    push DWORD 0
    push input_array
    call mergesort
    add esp,16
    
    ;recursive 2
    push output_array
    push DWORD ecx
    push DWORD [ebp-4]
    push input_array
    call mergesort
    add esp,16
    
    
    ;in puffer kopieren
    mov dword [ebp-8],ebx
    jmp comparison
    
    
 mov dword [ebp-8],0
    
for_loop:

PRINT_STRING "loop: "
PRINT_DEC 4,[ebp-8]
NEWLINE
    push ebx
    push ecx
    
    mov ebx,[ebp-8] ; schleifenvariable
    mov ecx, dword [eax+ebx]
    mov dword [edx+ebx],ecx
    
    pop ecx
    pop ebx

    inc dword [ebp-8]
comparison:
    cmp [ebp-8],ecx
    jl for_loop
    
    
    
  ; call mergesort merge
    
    
    

ret_point:
    pop ebp
    add esp,8
    ret
    
mergesort_ret:
    PRINT_STRING "quitt"
    NEWLINE
    pop ecx
    jmp ret_point
    
    
    
