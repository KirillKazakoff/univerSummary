masm 
model small
.stack 128
.data
A dw 16
B dw 4
.code
include macsos.inc

; процедура делит неотрицательное число X на 16
; в регистре BX - адрес X Результат записывается в X
DEL proc near
	mov cl,4
	shr word ptr [bx],cl ; в bx -адрес, должны указать сколько байт относится
				; этому адресу, иначе можно понять неоднозначно, word ptr - 2 байта
	ret
DEL endp

start:
	Init_ds
	Clear_r ax
	
	lea bx, A
	call DEL
	lea bx, B
	call DEL
	
	Exited
end start