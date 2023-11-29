ORG 100h
MOV AL,var1
LEA BX,var2
MOV CX,[BX]
LEA SI,Result
ADD CX,AX
MOV [SI],CL
ret
var1 db 10
var2 db 20
Result db ?




