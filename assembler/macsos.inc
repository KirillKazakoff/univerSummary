Exited macro
;;ending macros
	mov ax,4c00h
	int 21h
	endm

Init_ds macro
	mov ax,@data ;;changed
	mov ds,ax
	endm
	
Print_str macro strok
	push ax
	mov ah,09h
	mov dx,offset &strok
	int 21h
	Clear_r dx
	pop ax
	endm
	
Clear_r macro rg
;clear rg reg
	xor rg,rg
	endm
	
Print_char macro asc
	mov ah,02
	mov dl,&asc
	int 21h
endm
	

