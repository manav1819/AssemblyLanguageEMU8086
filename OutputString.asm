ORG 100h
mov ah, 0eh
lea bx, str
mov cl, 5
mov ch, 5

rep: 
mov al, 42
int 10h
mov al, 0ah 
int 10h
inc bx
loop rep
ret

str DB '*'