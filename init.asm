[org 0x8000]

start:
    mov si, INIT_STARTING
    call printf
    
    call start_shell

    mov si, INIT_STOPPING
    call printf
    ret

%include "printf.asm"
%include "command.asm"

INIT_STARTING: db "Starting Init!", 0xd, 0xa, 0
INIT_STOPPING: db "Stopping Init!", 0xd, 0xa, 0

times 512 - ($-$$) db 0