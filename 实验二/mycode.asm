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
    mov ds,ax;���ö���ַ
    
again1:
    mov dl,00h
    mov num,dl
    lea dx,str1
    mov ah,09h
    int 21h;�����һ����ʾ�ַ���
    
    lea si,str4
    mov ah,01h;��str4�ĵ�ַ����si��ַ�Ĵ���
    
do:    
    int 21h
    mov [si],al
    inc si
    inc num
    cmp al,0dh
    jnz do;ѭ�������ַ���    
    
    cmp num,0ah
    jg panduan1;�ж�������ַ������Ƿ����9����
    
again2:    
    lea dx,str2
    mov ah,09h
    int 21h;����ڶ�����ʾ�ַ���

    mov ah,01h
    int 21h
    sub al,30h
    mov x,al;����x

    mov dl,0AH
    mov ah,02h
    int 21h;����
    
    mov bh,num
    dec bh
    cmp x,bh
    jnl panduan2;�ж������x�Ƿ񳬷�Χ
    
    lea dx,str7
    mov ah,09h
    int 21h;������߸���ʾ�ַ���

    lea si,str4 
    mov ch,00h
    mov cl,x
    add si,cx
    mov ah,02h
    mov dl,[si]
    int 21h;���xλ���ַ�

    mov dl,0AH
    mov ah,02h
    int 21h;����    
again4:
    mov num2,00h
    
    lea dx,str8
    mov ah,09h
    int 21h;����ڰ˸���ʾ�ַ���
    
    mov ah,01h
    int 21h
    mov y,al;����ҪѰ�ҵ��ַ�y
    
    lea si,str4
    
again3:
    mov ch,y
    cmp [si],ch
    jz panduan3;�����ַ������ж��Ƿ���y���

    mov ah,24h
    cmp [si],ah
    jnz panduan6;�ж��Ƿ�������������ַ���

    mov dl,0AH
    mov ah,02h
    int 21h;����
    
    mov ah,00h
    cmp sum,ah
    jz  panduan5;�жϸ��ַ�y�Ƿ����
    
    lea dx,str10
    mov ah,09h
    int 21h;�����ʮ����ʾ�ַ���
    
    mov ah,02h
    mov dl,y
    int 21h;���y�ַ�
    
    lea dx,str11
    mov ah,09h
    int 21h;�����ʮһ����ʾ�ַ���
    
    mov ah,02h
    add sum,30h
    mov dl,sum
    int 21h;���y�ַ�
    
    MOV AX,4C00H
    INT
