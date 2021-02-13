[org 0x7e00]

; set boot drive to data stored in memory
mov [BOOT_DRIVE], dl

mov si, KERNEL_LOAD_STR
call printf

; load init into memory
mov al, 1
mov cl, 3
mov dl, [BOOT_DRIVE]
mov bx, 0x8000 ; where init is loaded into memory
call read_disk

mov si, INIT_LOADED
call printf

; run init
call 0x8000

; after running init panic
panic:
    mov si, KERNEL_PANIC_STR
    call printf
    jmp $

%include "printf.asm"

print_error_msg:
    mov si, PRINT_ERROR_MSG
    call printf
    ret

%include "read_disk.asm"

KERNEL_LOAD_STR: db "Kernel loaded.", 0xd, 0xa, 0
KERNEL_PANIC_STR: db "Kernel panic!", 0xd, 0xa, 0
INIT_LOADED: db "Init loaded!", 0xd, 0xa, 0
PRINT_ERROR_MSG: db "Error: ", 0
BOOT_DRIVE: db 0x00

times 512 - ($-$$) db 0