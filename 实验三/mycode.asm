DATA SEGMENT
LIST DW 5,200H,300H,400H,500H,600H
X DW 360H
DATA ENDS
CODE SEGMENT
ASSUME DS:DATA,CS:CODE
START:
    ; 设置数据段
    MOV AX, DATA
    MOV DS, AX
	;把数组总长度移动到CX当中
	LEA BX,LIST
	MOV CX,[BX]
	;把X移动到AX当中
	LEA BX,X
	XOR AX,AX
	MOV AX,[BX]
	;取数组的地址
	LEA BX,LIST
	;进行遍历比较
AGAIN:  
    ADD BX,2
	CMP AX,[BX]
	JA AGAIN2
	XCHG AX,[BX]
AGAIN2:	
    LOOP AGAIN
    ;将最后一个元素放到X的位置
    MOV X,AX
    ; 程序结束
    MOV AX,4C00H
    INT 21H
CODE ENDS
END START
