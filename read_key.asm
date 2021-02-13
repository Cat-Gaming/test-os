; returns:
; ah = scan code of key pressed
; al = ascii char of key pressed
read_key:
    mov ah, 00h
    int 16h
    ret