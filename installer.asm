%include "printf.asm"

print_error_msg:
    mov si, PRINT_ERROR_MSG
    call printf
    ret

%include "write_disk.asm"

install_os:
    ; write bootloader to hard disk
    mov al, 1 ; read 1 sector
    mov cl, 1 ; starting sector
    mov dl, 0x80 ; first hard drive
    mov bx, 0x7c00 ; where bootloader is located in memory
    call write_disk
    ; write kernel to hard disk
    mov cl, 2 ; starting sector
    mov bx, 0x7e00 ; where kernel is located in memory
    call write_disk
    ; write init to hard disk
    mov cl, 3 ; starting sector
    mov bx, 0x8000 ; where init is located in memory
    call write_disk
    ret

PRINT_ERROR_MSG: db "Error: ", 0