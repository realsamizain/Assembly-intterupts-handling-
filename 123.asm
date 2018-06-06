
jmp start 
clrscr:
MOV AH,6    ;THIS WILL CLEAR SCREEN
 MOV AL,0
        MOV BH,7
        MOV CX,0
        MOV DL,79
        MOV DH,24
        INT  10H
         MOV AH,2       ;THIS WILL CONTROL CURSOR LOCATION
        MOV BH,0
        MOV DH,0
        MOV DL,0
       int 10h
call input
start:
call clrscr

input:
maxlength: dw 80 ; maximum length of input
buffer: times 81 db 0 ; space for input string
 mov cx, [maxlength] ; load maximum length in cx
mov si, buffer ; point si to start of buffer
nextchar: mov ah, 1 ; service 1 – read character
int 0x21 ; dos services
cmp al, 13 ; is enter pressed
je exit ; yes, leave input
mov [si], al ; no, save this character
inc si ; increment buffer pointer
loop nextchar ; repeat for next input char
exit:
int 0x21 ; dos services
mov ax, 0x4c00 ; terminate program
int 0x21