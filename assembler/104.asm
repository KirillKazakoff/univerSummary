Masm
model small
.stack 128
.data
n dw ?
m dw ?
k dw ?
mas1 dw 100 dup (?)
mas2 dw 100 dup (?)
mas3 dw 100 dup (?)
outmas1 db 12 dup (?)
outmas2 db 12 dup (?)
stroka1 db 'Enter the first massive elements quantity',0dh,0ah,'$'
stroka2 db 'Enter the second massive elements quantity',0dh,0ah,'$'
stroka3 db 'Enter the third massive elements quantity',0dh,0ah,'$'
stroka4 db 'Enter the first massive elements',0dh,0ah,'$'
stroka5 db 'Enter the second massive elements',0dh,0ah,'$'
stroka6 db 'Enter the third massive elements',0dh,0ah,'$'
strokaerr db ' Invalid value entered',0dh,0ah,'$'
enterstr db 0ah,0dh,'$'
.code
	assume ds:@data,es:@data
.386
include macsos.inc 
include Frank.inc
include Output.inc

start:
	
	Init_ds
	mov es,ax
	Clear_r ax
	Print_str enterstr
	
;Input massive quantity(make it for each massive)
	Print_str stroka1
	Get_char
		Check_char strokaerr
			Input_char n,strokaerr
			
	Print_str stroka2
	Get_char
		Check_char strokaerr
			Input_char m,strokaerr
			
	Print_str stroka3
	Get_char
		Check_char strokaerr
			Input_char k,strokaerr 

	Print_str enterstr
	
;INPUT&OUTPUT			
;Insert elements in first massive
	Print_str stroka4
	mov cx,n 
	Go1:	
		cmp cx,0
		je Lol1
		Get_char
		Check_char strokaerr
			Input_char mas1[si],strokaerr
		add si,2
		dec cx
	jmp Go1
	
Lol1:
Clear_r bx
	lea bx,mas1	
	mov cx,n
	xor ax,ax ; zero in ax
	sled1: 
		cmp [bx],ax ; start comparing from zero
		jle new1
			mov si, bx
			mov di,cx
			mov ax,[bx]
		new1: 
			add bx,2 ; to next element(word size)
	loop sled1
	
	mov cx,di
	clearing1:
		add si,2
		mov word ptr [si],0
	loop clearing1
;First massive output
	
 
	Print_str enterstr
	Output n,mas1,outmas1,outmas2
	Print_str enterstr
	
	
;Insert elements in second massive
	Print_str stroka5
	mov cx,m
	Clear_r si
	Go2:	
		cmp cx,0
		je Lol2
		Get_char
		Check_char strokaerr
			Input_char mas2[si],strokaerr
		add si,2
		dec cx
	jmp Go2

;Second massive output
Lol2: 
	Clear_r bx
	lea bx,mas2	
	mov cx,m
	xor ax,ax ; zero in ax
	sled2: 
		cmp [bx],ax ; start comparing from zero
		jle new2
			mov si, bx
			mov di,cx
			mov ax,[bx]
		new2: 
			add bx,2 ; to next element(word size)
	loop sled2
	
	mov cx,di
	clearing2:
		add si,2
		mov word ptr [si],0
	loop clearing2

	Print_str enterstr
	Output m,mas2,outmas1,outmas2
	Print_str enterstr
	
;Insert elements in third massive
	Print_str stroka6
	mov cx,k 
	Clear_r si
	Go3:	
		cmp cx,0
		je Lol3
		Get_char
		Check_char strokaerr
			Input_char mas3[si],strokaerr
		add si,2
		dec cx
	jmp Go3

;Third massive output
Lol3: 

	Clear_r bx
	lea bx,mas3	
	mov cx,k
	xor ax,ax ; zero in ax
	sled3: 
		cmp [bx],ax ; start comparing from zero
		jle new3
			mov si, bx
			mov di,cx
			mov ax,[bx]
		new3: 
			add bx,2 ; to next element(word size)
	loop sled3
	
	mov cx,di
	clearing3:
		add si,2
		mov word ptr [si],0
	loop clearing3
	
	Print_str enterstr
	Output k,mas3,outmas1,outmas2
	Print_str enterstr
	
;END INPUT & OUTPUT
	Exited
end start
	
