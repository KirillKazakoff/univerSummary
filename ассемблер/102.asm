Masm
model small
.stack 128
.data
n equ 10
m equ 15
mas1 db n dup (?)
mas2 db m dup (?)
; процедура находит максимальный элемент массива
; адрес массива находится в регистре BX
; кол-во элементов - в CX
; результат возвращаем через AL
.code
include macsos.inc
max proc
	xor al,al ; в al - 0
	sled: 
		cmp [bx],al ; начнем сравнивать с 0, а не с первым элементом,удобнее т.к. в al уже 0
		jle new
		mov al,[bx]
		new: 
			inc bx ; переход к следующему элементу (размер элемента = 1 байту)
	loop sled
	ret
max endp

start:
	Init_ds
	Clear_r ax
	lea bx,mas1 ; фактический параметр - адрес массива в регистр
	mov cx,n ; фактический параметр - количество элементов в цикл
call max ; результат в al
	mov dl,al
	lea bx,mas2
	mov cx,m
call max
	add dl,al
	Exited
end start
	
