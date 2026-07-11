.model small
.stack 100h

.data
msg1 db "Enter a number: $"
msg2 db 13,10,'The number is Even$'
msg3 db 13,10,'The number is Odd$'

.code
main proc
    mov ax, @data
    mov ds, ax

    lea dx, msg1
    mov ah, 09h
    int 21h

    
read_loop:
    mov ah, 01h
    int 21h

    cmp al, 13        
    je check_even

    mov bl, al        
    jmp read_loop

check_even:
    sub bl, 30h       

    test bl, 1        
    jz even_label

   
    lea dx, msg3
    mov ah, 09h
    int 21h
    jmp exit

even_label:
    lea dx, msg2
    mov ah, 09h
    int 21h

exit:
    mov ah, 4Ch
    int 21h

main endp
end main