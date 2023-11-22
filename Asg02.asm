include 'emu8086.inc'

org 100h
MOV dx, 25
LEA di, sourceString 
LEA si, encryptedString
call GET_STRING  
putc 0dh
putc 0ah 
mov cx,dx

MOV al,[di] ; to check of the first char is 'M'
CMP al,77
JE  encripting25

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
    
jmp exit   

encripting25:
    mov al, [di]     
    xor al, key1
    mov [si],al   
    inc di
    inc si
    loop encripting25 
    lea si, encryptedString
    call PRINT_STRING
    putc 0dh
    putc 0ah 

mov cx,dx   
lea di, encryptedString
lea si, decriptedString
decripting25:                
    
    mov al, [di]
    xor al, key1
    mov [si],al
    inc di
    inc si
    loop decripting25
    putc 0dh
    putc 0ah  
    lea si, decriptedString
    call PRINT_STRING

exit: ret

sourceString db 25 dup(?)
encryptedString db 25 dup(0)
decriptedString db 25 dup(0)
key1 equ 25
key equ 53 

DEFINE_PRINT_STRING   
DEFINE_GET_STRING




