.DATA
    MSG DB 'Enter a string: $'
    BUFFER DB 100 DUP('$')   ; buffer to hold the string

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX
    LEA DX,MSG
    MOV AH,09H
    INT 21H

    LEA SI,BUFFER        
    MOV CX,0             

INPUT:
    MOV AH,01H
    INT 21H
    CMP AL,13             
    JE OUTPUT
    MOV [SI],AL           
    INC SI
    INC CX
    JMP INPUT

OUTPUT:
    MOV DL,0DH
    MOV AH,02H
    INT 21H
    MOV DL,0AH
    INT 21H

    LEA SI,BUFFER         

PRINT:
    MOV DL,[SI]           
    MOV AH,02H
    INT 21H                
    MOV DL,0DH
    INT 21H                
    MOV DL,0AH
    INT 21H                
    INC SI
    LOOP PRINT

    MOV AH,4CH
    INT 21H
MAIN ENDP
END MAIN