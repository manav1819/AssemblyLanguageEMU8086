include 'emu8086.inc'

org 100h
MOV dx, 10
LEA di, sourceString 
LEA si, encryptedString
call GET_STRING
putc 0dh
putc 0ah 
mov cx,dx
; save to another string define in your program call encryptedString
encripting:
    mov al, [di]     
    xor al, key
    mov [si],al   
    inc di
    inc si
    loop encripting 
    lea si, encryptedString
    call PRINT_STRING
    putc 0dh
    
    putc 0ah 

mov cx,dx   
lea di, encryptedString
lea si, decriptedString
decripting:                
    
    mov al, [di]
    xor al, key
    mov [si],al
    inc di
    inc si
    loop decripting
    putc 0dh
    putc 0ah  
    lea si, decriptedString
    call PRINT_STRING

ret 

sourceString db 10 dup(?)
encryptedString db 10 dup(0)
decriptedString db 10 dup(0)
key equ 12  

DEFINE_PRINT_STRING   
DEFINE_GET_STRING




