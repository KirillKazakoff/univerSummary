Output macro val,msv,ot,ott
local OutCycl,FILL_BUF_,CLR_DVD_,NOMORE_
mov cx,&val
Clear_r si
sub si,2
OutCycl:
	add si,2
	mov ax,&msv[si]
	
	push bx 
	push si
    push cx
    push dx
    push di
    push ax
	
	mov cx,10
	lea si,&ot
FILL_BUF_:
    mov byte ptr [si],' '
    inc si
    LOOP FILL_BUF_
    mov byte ptr [si],'$'
    mov di,10
    or ax,ax
    jns CLR_DVD_
    neg ax
CLR_DVD_:
    xor dx,dx
    div di
    add dx,'0'
    dec si
    mov byte ptr [si],dl
    inc cx
    or ax,ax
    jnz CLR_DVD_
    
    pop ax
    or ax,ax
    jns NOMORE_
    dec si
    mov byte ptr [si],'-'
    inc cx
NOMORE_:
	cld 
	lea di,&ott
	inc cx
	rep movs &ot,&ott 		;send symbols from the end without '20'
	
	Print_str &ott
	Print_char 20h
	
    pop di
    pop dx
    pop cx
	pop si
	pop bx
	
loop OutCycl
endm
