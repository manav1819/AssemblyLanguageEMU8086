; Program is loaded at CS:0100h
ORG 100h
mov bl, 65h		;Initialize bl with ASCII value

cmp bl,41h		; D-1
jl Not_A_Letter

cmp bl,5Ah		;D-2
jle convert_to_lower

cmp bl,61h		;D-3
jl Not_A_Letter

cmp bl,7ah		;D-4
jle convert_to_upper

Not_A_Letter:
;code to display that the value is not a letter
 mov bl, 'N'
jmp display

convert_to_lower:
add bl,20h ;or bl, 20h
jmp display

convert_to_upper:
sub bl,20h

display: mov ah, 0eh
 mov al, bl
 int 10h
stop:
ret


ret




