ORG 100h
LEA AX, var1
LEA BX, var2
MOV [BX], 0ABCDh
MOV BX,AX
MOV [BX], 8
RET
var1 DB 7
var2 DW 1234h
