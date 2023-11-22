
org 100h

MOV AL, a
MUL b
SUB AX, 200
MOV result, AX

ret           
a      DB 235
b      DB 138
result DW   ?




