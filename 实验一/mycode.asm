;�Ӽ��̽�������������5��ʮ�������֣�����ʮ������ʽ��ʾ��͡� 
DATA SEGMENT
    X DB '?'
    Y DB '?'
    STR1 DB 'PLEASE ENTER A NUMBER (0-4):$'
DATA ENDS
CODE SEGMENT
ASSUME DS:DATA,CS:CODE
START:
; �������ݶ�
    MOV AX, DATA
    MOV DS, AX
;�����ʾ���
    LEA DX,STR1
	MOV AH,09H
	INT 21H
;��������
    MOV AH,01H
	INT 21H
;��ASCII��������
   SUB AL,30H
   MOV BL,AL
;�������
	MOV DL,10
	MOV AH,02H
	INT 21H
;�����ʾ���
    LEA DX,STR1
	MOV AH,09H
	INT 21H
;��������
    MOV AH,01H
	INT 21H
;��ASCII��������
    SUB AL,30H
    MOV CL,AL
;���мӷ�����
    ADD CL,BL
;�������
	MOV DL,10
	MOV AH,02H
	INT 21H	
;�����ӦASCII�����ַ����
    ADD CL,30H
    MOV DL,CL
 
	
    MOV AH,02H
    INT 21H
   
    MOV AX,4C00H
    INT 21H
CODE ENDS
END START
