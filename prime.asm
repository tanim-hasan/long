
.data
msg1 db 'Enter a number: $'
msg2 db 13,10,'The number is PRIME$'
msg3 db 13,10,'The number is NOT PRIME$'

num dw 0

.code
main proc
    mov ax,@data
    mov ds,ax

    lea dx,msg1
    mov ah,09h
    int 21h

    mov word ptr num,0

read:
    mov ah,01h
    int 21h

    cmp al,13
    je check

    sub al,'0'
    mov bl,al
    mov ax,num
    mov cx,10
    mul cx
    add ax,bx
    mov num,ax
    jmp read

check:
    mov ax,num

    cmp ax,2
    jb notprime
    je prime

    mov cx,2

loop1:
    mov ax,num
    mov dx,0
    div cx

    cmp dx,0
    je notprime

    inc cx

    mov ax,num
    shr ax,1
    cmp cx,ax
    jbe loop1

prime:
    lea dx,msg2
    mov ah,09h
    int 21h
    jmp exit

notprime:
    lea dx,msg3
    mov ah,09h
    int 21h

exit:
    mov ah,4Ch
    int 21h

main endp
end main