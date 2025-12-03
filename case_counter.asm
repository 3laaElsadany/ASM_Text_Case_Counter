.model small               ; Selects the small memory model (separate code & data, each max 64KB)
.stack 100h                ; Reserves 256 bytes for the program stack            

.data                     
    msg1 db "Enter a word: $"
    upperMsg db 13,10, "Uppercase letters: $"
    lowerMsg db 13,10, "Lowercase letters: $"
    inputStr db 50 dup('$')     ; Buffer for user input

.code
main proc

    mov ax, @data          
    mov ds, ax             ; Load data segment

    mov dx, offset msg1    
    mov ah, 9              
    int 21h                ; Print input prompt

    mov si, offset inputStr ; Pointer to input buffer
                    
read_loop:                 
    mov ah, 1              
    int 21h                ; Read a character from keyboard
    cmp al, 13             
    je done_input          ; Stop on Enter

    mov [si], al           ; Store the character
    inc si                 ; Move to next position
    jmp read_loop

done_input:                
    mov [si], '$'          ; Terminate the string
    mov si, offset inputStr

    mov bl, 0              ; Uppercase counter
    mov bh, 0              ; Lowercase counter

count_loop:                
    mov al, [si]
    cmp al, '$'
    je show_result         ; End of string

    ; Check uppercase
    cmp al, 'A'
    jb check_small
    cmp al, 'Z'
    ja check_small
    inc bl                 ; Increment uppercase count
    jmp next_char

check_small:
    ; Check lowercase
    cmp al, 'a'
    jb next_char
    cmp al, 'z'
    ja next_char
    inc bh                 ; Increment lowercase count

next_char:
    inc si                 ; Move to next character
    jmp count_loop

show_result:
    mov dx, offset upperMsg
    mov ah, 9
    int 21h                ; Print uppercase label

    mov al, bl
    call PrintNumber       ; Print uppercase count

    mov dx, offset lowerMsg
    mov ah, 9
    int 21h                ; Print lowercase label

    mov al, bh
    call PrintNumber       ; Print lowercase count

    mov ah, 4Ch
    int 21h                ; Exit program

main endp

PrintNumber proc
    add al, 30h            ; Convert number to ASCII
    mov dl, al
    mov ah, 2
    int 21h                ; Print single digit
    ret
PrintNumber endp

end main
