[org 0x7c00]

; read kernel from drive
mov al, 1
mov cl, 2
mov bx, 0x7e00
call read_disk

; jump to kernel execution
jmp 0x7e00

print_error_msg:
    mov ah, 0x0e
    mov al, 'E'
    int 10h
    mov al, 'r'
    int 10h
    int 10h
    mov al, 'o'
    int 10h
    mov al, 'r'
    int 10h
    mov al, ':'
    int 10h
    mov al, ' '
    int 10h
    ret

%include "read_disk.asm"

times 510 - ($-$$) db 0
db 0x55, 0xaa