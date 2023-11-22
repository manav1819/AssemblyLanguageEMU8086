
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt
include 'emu8086.inc'
org 100h
LEA SI, array
MOV AL, 0

loop1:  
        MOV BL,[SI]
        MOV CL,valueLookfor
        CMP BL,CL
        JE reassign
        INC AL
        INC SI
        CMP AL,10
        JGE notfound
        loop loop1
reassign: 
        MOV found,1
        MOV index,AL
        
      PRINT "Item is found."
      PUTC 0ah
      PUTC 0dh
      ret   
         
         
notfound:
        PRINT "Item is not found."
        PUTC 0ah
        PUTC 0dh
        ret

array db 0,1,2,3,4,5,6,7,8,9
found db 0
i db ?
index db ?
valueLookfor db 5



