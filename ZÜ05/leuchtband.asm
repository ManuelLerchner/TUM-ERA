%include "io.inc"


section .data
bargraph_display:
    dw 0

section .text
global CMAIN
CMAIN:
    mov ebp, esp; for correct debugging
    ;write your code here
    xor eax, eax
    
    call init_bargraph
    
    call step_bargraph2
     call step_bargraph2
      call step_bargraph2
       call step_bargraph2
    
    ret
    
    
init_bargraph:
    mov word [bargraph_display],0

    ret
    
    
    
    
step_bargraph1:
    
    cmp word [bargraph_display],0
    je initialize_bragraph_1
    
    sar word [bargraph_display],1
    
    ret
    
    
step_bargraph2:
    
    cmp word [bargraph_display],0
    je initialize_bragraph_1
    
    ror word [bargraph_display],1
    
    ret
    

initialize_bragraph_1:

    mov word [bargraph_display], 0x8000