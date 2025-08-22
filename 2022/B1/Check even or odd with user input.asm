; Check a number is even or not
; If even, put 0001h in DX
; If odd, put 0000h in DX

org 100h


main:
mov ah, 01h
int 21h
; Now AH contains the number
; But the number is in ASCII form
; To convert it to decimal form,
; we substract 48 from it 
mov ah, 0
sub al, 48
mov bl, 2h
div bl
cmp ah, 0h
je even
jne odd
END_PROGRAM:
hlt          


check db 10

even:
mov dx, 0001h
jmp END_PROGRAM

odd:
mov dx, 0000h
jmp END_PROGRAM