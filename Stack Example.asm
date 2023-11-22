org 100h

mov al, 15
mov bl, 20
mov cl, 25

call calc 
mov result, ax
ret

calc proc
        add al,cl
        mul bl
        call calcAgain
     ret
calc endp


calcAgain proc
    add cx,5
    add ax,cx
    mul bx
    ret
calcAgain endp

result dw 0
