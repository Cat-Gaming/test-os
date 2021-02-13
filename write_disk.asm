; al = sectors to write count
; cl = starting sector
; dl = drive
; es:bx = buffer address pointer to read from
write_disk:
    mov ah, 03h
    mov ch, 00h
    mov dh, 00h
    int 13h
    jc .error
    ret
.error:
    call print_error_msg
    mov ah, 0x0e
    mov al, 'D'
    int 10h
    mov al, 'E'
    int 10h
    jmp $