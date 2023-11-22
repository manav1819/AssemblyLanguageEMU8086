include 'emu8086.inc'                                 
org 100h

mov dx, 15
lea di, str
call GET_STRING
putc 0dh
putc 0ah
mov cx,dx

rep: mov al,[di] 

     cmp al,41h		;D-1
     jl Not_A_Letter

     cmp al,5Ah		;D-2
     jle convert_to_lower

     cmp al,61h		;D-3
     jl Not_A_Letter

     cmp al,7ah		;D-4
     jle convert_to_upper

     Not_A_Letter:
     ;code to display that the value is not a letter
     mov al, 'N'
     jmp display

     convert_to_lower:
     add al,20h ;or bl, 20h
     jmp display

     convert_to_upper:
     sub al,20h


display: putc al
         inc di
         loop rep
ret
str db 10 dup(?)

DEFINE_GET_STRING