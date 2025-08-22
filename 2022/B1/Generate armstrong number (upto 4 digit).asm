; Generate armstrong number (upto 4 digits)
org 100h


mov cx, 4
mov bx, number
mov si, 0
extract_digits:
    mov ax, bx
    cmp ax, 0
    ; Check if the number is 0
    ; Then we have finished extracting 
    ; our digit.
    ; Else incremenet number of digits and
    ; continue.
    je generate_armstrong
    inc no_of_digits
    ; Divide AX by 10
    div ten
    ; Now AH holds the remainder (which is our digit) and
    ; AL holds the quotient
    mov digits[si], ah
    ; Move the quotient in BX 
    ; to continue with remaining digits
    mov bl, al
    mov bh, 0  
    inc si
    loop extract_digits

generate_armstrong:
    mov cl, no_of_digits
    mov ch, 0
    mov si, 0
    mov dx, 0 ; DX will hold our sum
    mov ax, 0 ; AX will hold the power
    itr_through_digits:
        mov al, digits[si]
        push cx
        mov cl, no_of_digits
        mov ch, 0
        calculate_power:
              mul digits[si]
              loop calculate_power
        add dx, ax
        inc si
        pop cx
        loop itr_through_digits
       
mov arm, dx    



number dw 153
no_of_digits db 0
digits db 3 dup(0)
arm dw 0 
ten db 10
end