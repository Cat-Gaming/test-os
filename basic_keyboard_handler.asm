%include "read_key.asm"

; a basic keyboard handler
basic_key_loop:
    call read_key
    cmp al, 0xd ; newline
    je .basic_key_newline
    cmp al, 0x8 ; backspace
    je .basic_key_backspace
    cmp al, 0x1B ; esc
    je .basic_key_loop_break
    mov ah, 0x0e
    int 0x10
    jmp basic_key_loop
.basic_key_newline:
    mov ah, 0x0e
    mov al, 0xd
    int 0x10
    mov al, 0xa
    int 0x10
    jmp basic_key_loop
.basic_key_backspace:
    mov ah, 0x0e
    mov al, 0x8
    int 0x10
    mov al, ' '
    int 0x10
    mov al, 0x8
    int 0x10
    jmp basic_key_loop
.basic_key_loop_break:
    ret

keyboard_test:
    mov si, KEY_TEST_BEGIN
    call printf

    mov si, KEY_BREAK_MSG
    call printf

    ; call basic key handler until user presses escape
    call basic_key_loop

    ; make a newline because user hasn't
    mov ah, 0x0e
    mov al, 0xd
    int 0x10
    mov al, 0xa
    int 0x10

    mov si, KEY_TEST_COMPLETED
    call printf
    ret

KEY_BREAK_MSG: db "To stop the input handler press Esc.", 0xd, 0xa, 0
KEY_TEST_BEGIN: db "Keyboard test started.", 0xd, 0xa, 0
KEY_TEST_COMPLETED: db "Keyboard test completed.", 0xd, 0xa, 0