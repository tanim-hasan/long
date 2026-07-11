.DATA
    MSG DB 'Enter a string: $'

.CODE
MAIN PROC
    MOV AX,@DATA
    MOV DS,AX

    LEA DX,MSG
    MOV AH,09H
    INT 21H

    MOV CX,0            

INPUT:
    MOV AH,01H           
    INT 21H
    CMP AL,13            
    JE OUTPUT
    MOV AH,00H
    PUSH AX              
    INC CX
    JMP INPUT

OUTPUT:
    MOV AH,02H
    MOV DL,0DH           
    INT 21H
    MOV DL,0AH           
    INT 21H


PRINT:
    POP DX              
    INT 21H
    LOOP PRINT

    MOV AH,4CH
    INT 21H

MAIN ENDP
END MAIN