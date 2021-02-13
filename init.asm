[org 0x8000]

start:
    mov si, INIT_STARTING
    call printf
    
    ; checks if needs to install
    cmp byte [BOOT_DRIVE], 0x80
    jg .install ; jump if drive is not hard disk

    ; tests keyboard
    call keyboard_test

    mov si, INIT_STOPPING
    call printf
    ret

.install:
    mov si, INSTALLING_OS
    call printf

    call install_os

    mov si, OS_INSTALLED
    call printf

    mov si, REBOOT_COMPUTER_MSG
    call printf
    jmp $

BOOT_DRIVE: equ 0x7fff
%include "installer.asm"
%include "read_key.asm"
%include "command.asm"
%include "basic_keyboard_handler.asm"

INIT_STARTING: db "Starting Init!", 0xd, 0xa, 0
INIT_STOPPING: db "Stopping Init!", 0xd, 0xa, 0
INSTALLING_OS: db "Installing OS to first Hard Disk.", 0xd, 0xa, 0
OS_INSTALLED: db "OS installed to first Hard Disk.", 0xd, 0xa, 0
REBOOT_COMPUTER_MSG: db "Reboot the computer!", 0xd, 0xa, 0

times 512 - ($-$$) db 0