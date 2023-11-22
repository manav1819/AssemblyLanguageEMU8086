
; You may customize this and other start-up templates; 
; The location of this template is c:\emu8086\inc\0_com_template.txt

org 100h

lea di,var1
mov al,[di]
lea di, var2
add al,[di] 
lea di, var3
add al,[di]
 
ret

var1 db 4
var2 db 5
var3 db 2




