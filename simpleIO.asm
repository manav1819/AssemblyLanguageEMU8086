include 'emu8086.inc'                                 
org 100h

mov dx, 10
lea di, str
call GET_STRING
putc 0dh
putc 0ah
mov cx,dx

rep: mov al,[di]
     putc al
     inc di
     loop rep
ret
str db 11 dup(?)

DEFINE_GET_STRING