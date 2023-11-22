
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

include 'emu8086.inc'
org 100h

MOV DX, 10
LEA DI, str
MOV SI,DI
CALL GET_STRING      
MOV CX, 0

repeat: MOV AL, [DI]
        CMP AL, 0
        JE chk_chr_length
        INC CX
        INC DI
        
        JMP repeat

chk_chr_length: PUTC 'N'
                MOV AL,CL
                ADD AL, 48
                PUTC AL
                SHR CX,1
          back: MOV AL,[SI]
                MOV BL,[DI-1]
                CMP AL,BL
                JE next
                JMP notpalindrome
                
          next: INC SI
                DEC DI
                LOOP back
                PUTC 'P'
                PUTC 'L'
                JMP finish

notpalindrome: PUTC 'N'
               PUTC 'P'
               JMP finish
finish: ret

str db 10 dup(0)        
DEFINE_GET_STRING


