data segment
  str1  db 'Please input a string(length<9):$'
  str2  db 'Please input the index of the char to display:$'
  str3  db 'The index is invalid!$'
  str4  db '$'
  str5  db 'please input a char:$'
  str6  db 'The string is too long!$'
  str7  db 'The char is: $'
  str8  db 'Please input a char:$'
  str9  db 'The index is:$'
  str10 db 'The count of "$'
  str11 db '" is :$'
  str12 db 'The char is invalid!$'
  num  db 00h
  x    db 00h
  y    db 00h
  sum  db 00h
  num2 db 00h
  bool db 00h
data ends 
code segment
assume ds:data,cs:code
start:
    mov ax,data
    mov ds,ax;设置段首址
    
again1:
    mov dl,00h
    mov num,dl
    lea dx,str1
    mov ah,09h
    int 21h;输出第一个提示字符串
    
    lea si,str4
    mov ah,01h;将str4的地址赋给si变址寄存器
    
do:    
    int 21h
    mov [si],al
    inc si
    inc num
    cmp al,0dh
    jnz do;循环输入字符串    
    
    cmp num,0ah
    jg panduan1;判断输入的字符数量是否大于9个；
    
again2:    
    lea dx,str2
    mov ah,09h
    int 21h;输出第二个提示字符串

    mov ah,01h
    int 21h
    sub al,30h
    mov x,al;输入x

    mov dl,0AH
    mov ah,02h
    int 21h;换行
    
    mov bh,num
    dec bh
    cmp x,bh
    jnl panduan2;判断输入的x是否超范围
    
    lea dx,str7
    mov ah,09h
    int 21h;输出第七个提示字符串

    lea si,str4 
    mov ch,00h
    mov cl,x
    add si,cx
    mov ah,02h
    mov dl,[si]
    int 21h;输出x位的字符

    mov dl,0AH
    mov ah,02h
    int 21h;换行    
again4:
    mov num2,00h
    
    lea dx,str8
    mov ah,09h
    int 21h;输出第八个提示字符串
    
    mov ah,01h
    int 21h
    mov y,al;输入要寻找的字符y
    
    lea si,str4
    
again3:
    mov ch,y
    cmp [si],ch
    jz panduan3;遍历字符串，判断是否与y相等

    mov ah,24h
    cmp [si],ah
    jnz panduan6;判断是否遍历完了整个字符串

    mov dl,0AH
    mov ah,02h
    int 21h;换行
    
    mov ah,00h
    cmp sum,ah
    jz  panduan5;判断该字符y是否存在
    
    lea dx,str10
    mov ah,09h
    int 21h;输出第十个提示字符串
    
    mov ah,02h
    mov dl,y
    int 21h;输出y字符
    
    lea dx,str11
    mov ah,09h
    int 21h;输出第十一个提示字符串
    
    mov ah,02h
    add sum,30h
    mov dl,sum
    int 21h;输出y字符
    
    MOV AX,4C00H
    INT
