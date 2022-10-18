masm 
model small
.stack 128
.data
A dw 16
B dw 4
.code
include lib.inc

; ��������� ����� ��������������� ����� X �� 16
; � �������� BX - ����� X ��������� ������������ � X
DEL proc near
	mov cl,4
	shr word ptr [bx],cl ; � bx -�����, ������ ������� ������� ���� ���������
				; ����� ������, ����� ����� ������ ������������, word ptr - 2 �����
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