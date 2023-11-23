include 'emu8086.inc'
org 100h

MOV DX, 20
LEA DI, str
MOV SI,DI
MOV AL,0
MOV pcounter,AL
CALL GET_STRING      
MOV CX, 0           ; LETTER COUNT

repeat: 
        MOV AL, [DI]
        CMP AL, 32
        JE chk_chr_length
        CMP AL, 0
        JE last_chk;check if the last word is palindrome
        INC DI     ;point to next char
        INC CX     ;word length counter
        JMP repeat
       
chk_chr_length:
        PUSH DI    ;store DI in stack for next word
        SHR CX,1   ;word length divided by 2. that many times loop should run to check if palindrome
        
back:
        MOV AL,[SI]    ;AL contains 1st char of a word
        MOV BL,[DI-1]  ;BL contains last char of a word
        CMP AL,BL
        JE next        ;jmp to compare next character 
        JMP repeat1    ;if char does not match no need to check the whole word
        
next: 
        INC SI
        DEC DI
        LOOP back
        MOV AL,pcounter    ;palindrome word counter
        INC AL             ;
        MOV pcounter,AL    ;
        
repeat1:
        POP DI    ;DI is brought back to the space between the words
        INC DI    ;DI points to 1st char of next word
        MOV SI,DI ;storing DI in SI to later check for palindrome
        MOV CX,0
        MOV AL,0
        JNE repeat
        
last_chk:
        SHR CX,1
backl:
        MOV AL,[SI]  
        MOV BL,[DI-1]
        CMP AL,BL
        JE lnext
        JMP finish
lnext:  
        INC SI
        DEC DI
        LOOP backl
        MOV AL,pcounter
        INC AL
        MOV pcounter,AL

        
finish: 
PRINTN ""   
PRINT "The number of palindrome words are: "
MOV AL,pcounter
ADD AL,48
PUTC AL
RET

str db 20 dup(0) 
pcounter db ?       
DEFINE_GET_STRING


