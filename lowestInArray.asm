
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
include 'emu8086.inc'
org 100h

LEA SI, array ;point towards array
MOV AL, [SI]  ; stores 1st array element in AL Register            
MOV minvalue,AL
MOV CX,10     ; loop iterator
MOV DL,0      ; index counter
loop1:
    MOV AL,[SI]        
    INC DL
    CMP minvalue,AL
    JLE nexti
    MOV minvalue,AL
    MOV index,DL
    
nexti: 
    INC SI
    loop loop1
    

PRINTN "The lowest element of the array is: "
RET


array db 10,1,2,3,4,5,6,7,8,9
minvalue db ?
i db ?
index db ?




