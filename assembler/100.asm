masm 
model small
.stack 128
.data
A dw 12
B dw 13
REZ dw ?
.code
include lib.inc
; ��������� ��������� ������������ �� ���� �����
; ������ ����� � AX, ������ - � BX
; ��������� ���������� � AX
MAX proc ; �� ��������� ��������� �������� ����
	cmp ax,bx
	jge M
	mov ax,bx
	M: ret ; ������� �� ���������
MAX endp


start:
	Init_ds
	Clear_r ax
	
	mov ax,A
	mov bx,B
	call MAX ; ��������� � AX
	mov rez,ax
	mov ax,5
	mov bx,A
	dec bx
	call MAX ; ��������� � AX
	add rez,ax
	Exited
end start