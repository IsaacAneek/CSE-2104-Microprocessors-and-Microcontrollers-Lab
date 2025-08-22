               ; 1 + r^2 + r^3 + ..... + r^n 
; solve this using procedure. 
; pass the parameters (r, n) using stack 

org 100h

main:
mov dx, 1 ;sum
mov ax, 3
push ax ;r
mov ax, 4
push ax ;n  

call sum

mov ah, 4ch
int 21h

proc sum near:        
    push bp
    mov bp, sp
    mov bl, [bp+6] ;r
    mov cl, [bp+4] ;n 
    pop bp
    sum_:   
    mov ch, 0
    push cx 
    mov ah, 0
    mov al, 1
        pow:

        mul bl    
        loop pow
         
    add dx, ax
    pop cx
    loop sum_  
    ret       