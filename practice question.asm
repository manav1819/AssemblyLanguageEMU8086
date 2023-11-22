org 100h

MOV AL,x
MOV BL,y
ADD AL,BL
MOV BL,[z]
ADD AL,BL
MOV result, AL

ret
x db 2
y db 3
z db 4
result db ?



