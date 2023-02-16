;从键盘接收两个不大于5的十进制数字，并以十进制形式显示其和。 
DATA SEGMENT
    X DB '?'
    Y DB '?'
    STR1 DB 'PLEASE ENTER A NUMBER (0-4):$'
DATA ENDS
CODE SEGMENT
ASSUME DS:DATA,CS:CODE
START:
; 设置数据段
    MOV AX, DATA
    MOV DS, AX
;输出提示语句
    LEA DX,STR1
	MOV AH,09H
	INT 21H
;输入数字
    MOV AH,01H
	INT 21H
;将ASCII进行修正
   SUB AL,30H
   MOV BL,AL
;换行输出
	MOV DL,10
	MOV AH,02H
	INT 21H
;输出提示语句
    LEA DX,STR1
	MOV AH,09H
	INT 21H
;输入数字
    MOV AH,01H
	INT 21H
;将ASCII进行修正
    SUB AL,30H
    MOV CL,AL
;进行加法运算
    ADD CL,BL
;换行输出
	MOV DL,10
	MOV AH,02H
	INT 21H	
;变成相应ASCII进行字符输出
    ADD CL,30H
    MOV DL,CL
 
	
    MOV AH,02H
    INT 21H
   
    MOV AX,4C00H
    INT 21H
CODE ENDS
END START
