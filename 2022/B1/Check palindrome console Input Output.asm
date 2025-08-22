; Write a program that checks whether a given string is palindrome. 
; Ognore punctuation and spaces. 
; Use the console to take the input string from the user and print the output in the console. 
; You can't use another variable/constant to store the length of the string 

org 100h

main:
lea si, input_string
mov cl, size      
input:
    mov ah, 01h
    int 21h
    mov [si], al
    
    inc si
                
    cmp al, '$' 
    je end_input
    inc cl
    mov size, cl
    mov ah, 0
    push ax
    jmp input

end_input:
    mov si, offset input_string
    mov ch, 0
    check_pal:
        pop bx
        mov al, [si]
        inc si
        cmp al, bl
        jne no_pal
        loop check_pal
    
    mov dx, offset yes
    mov ah, 09h
    int 21h
    jmp end_code
    
    no_pal:
    mov dx, offset no
    mov ah, 09h
    int 21h   
    
end_code: 
mssg db "Hello world", 13, 10, '$'
input_string db 100 dup(?)
no db "Its not palindrome$"
yes db "Its palindrome$"
size db 0
end