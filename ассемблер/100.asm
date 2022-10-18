masm 
model small
.stack 128
.data
A dw 12
B dw 13
REZ dw ?
.code
include macsos.inc
; процедура вычисляет максимальное из двух чисел
; первое число в AX, второе - в BX
; результат помещается в AX
MAX proc ; по умолчанию процедура ближнего типа
	cmp ax,bx
	jge M
	mov ax,bx
	M: ret ; возврат из процедуры
MAX endp


start:
	Init_ds
	Clear_r ax
	
	mov ax,A
	mov bx,B
	call MAX ; результат в AX
	mov rez,ax
	mov ax,5
	mov bx,A
	dec bx
	call MAX ; результат в AX
	add rez,ax
	Exited
end start