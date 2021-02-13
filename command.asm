%include "read_key.asm"

; shell key loop
shell_key_loop:
    call read_key
    cmp al, 0xd ; newline
    je .shell_key_newline
    cmp al, 0x8 ; backspace
    je .shell_key_backspace
    mov ah, 0x0e
    int 0x10
    jmp shell_key_loop
.shell_key_newline:
    mov ah, 0x0e
    mov al, 0xd
    int 0x10
    mov al, 0xa
    int 0x10
    call shell_prompt
    jmp shell_key_loop
.shell_key_backspace:
    mov ah, 0x0e
    mov al, 0x8
    int 0x10
    mov al, ' '
    int 0x10
    mov al, 0x8
    int 0x10
    jmp shell_key_loop
start_shell:
    call shell_prompt
    jmp shell_key_loop
shell_prompt:
    mov ah, 0x0e
    mov al, '>'
    int 0x10
    ret
