; We are given two strings of same length.
; Find the occurrence of each character in both string.
; And check if they are equal or not.

org 100h

string1 db "abcdef"
string2 db "aabbcc"

freq_str_1 db 26 dup(0)
freq_str_2 db 26 dup(0)

main:
mov cx, 6
mov si, 0
string_iterate:
    mov al, string1[si]
    mov ah, 0
    ; Initially the array holds the ASCII value of chars.
    ; Substract 97 to get the actual index of alphabet
    ; starting from 0
    sub ax, 97
    mov di, ax
    mov al, freq_str_1[di]
    mov ah, 0
    inc ax
    mov freq_str_1[di], al
    
    mov al, string2[si]
    mov ah, 0
    sub ax, 97
    mov di, ax
    mov al, freq_str_2[di]
    mov ah, 0
    inc ax
    mov freq_str_2[di], al
    
    inc si
    loop string_iterate

mov cx, 26
mov si, 0
check_occurence:
    mov al, freq_str_1[si]
    mov bh, freq_str_2[si]
    cmp al, bh
    jne not_equal

mov dx, 1111h
jmp end_of_code

not_equal:
    mov dx, 1010h

end_of_code:
end
    
