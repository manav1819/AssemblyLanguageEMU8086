include 'emu8086.inc'
org 100h             

MOV dx,10
LEA di, str
CALL GET_STRING
putc 0dh
putc 0ah           
 
get_len:  
        MOV AL,[DI]
        CMP AL,0
        
ret

str db 10 dup(0)
np db "NOt a Plaindrome",/0
p db "Plaindrome",/0
strlen db 0

DEFINE_GET_STRING
DEFINE_PRINT_STRING


