Masm
model small
.stack 128
.data
n equ 10
m equ 15
mas1 db n dup (?)
mas2 db m dup (?)
; ��������� ������� ������������ ������� �������
; ����� ������� ��������� � �������� BX
; ���-�� ��������� - � CX
; ��������� ���������� ����� AL
.code
include lib.inc
max proc
	xor al,al ; � al - 0
	sled: 
		cmp [bx],al ; ������ ���������� � 0, � �� � ������ ���������,������� �.�. � al ��� 0
		jle new
		mov al,[bx]
		new: 
			inc bx ; ������� � ���������� �������� (������ �������� = 1 �����)
	loop sled
	ret
max endp

start:
	Init_ds
	Clear_r ax
	lea bx,mas1 ; ����������� �������� - ����� ������� � �������
	mov cx,n ; ����������� �������� - ���������� ��������� � ����
call max ; ��������� � al
	mov dl,al
	lea bx,mas2
	mov cx,m
call max
	add dl,al
	Exited
end start
	
