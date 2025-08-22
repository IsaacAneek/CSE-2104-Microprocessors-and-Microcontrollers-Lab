; Take a string. Then reverse it using stack and procedure. 
; Store the reverse string in a previously used string. 
; Don't use any further strings.
org 100h

main:
mov cx, 6
mov si, 0

push_chars_stack:
mov al, string[si]
mov ah, 0
push ax
inc si
loop push_chars_stack

mov cx, 6
mov si, 0

pop_chars_stack:
pop ax
mov ah, 0
mov string[si], al
inc si
loop pop_chars_stack


string db "abcdef"

end

