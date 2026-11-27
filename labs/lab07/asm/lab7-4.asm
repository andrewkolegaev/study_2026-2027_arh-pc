%include 'in_out.asm'

section .data
msg_x db 'Введите x: ',0h
msg_a db 'Введите a: ',0h
msg_res db 'Результат: ',0h

section .bss
x resb 80
a resb 80
res resb 80

section .text
global _start

_start:
mov eax,msg_x
call sprint
mov ecx,x
mov edx,80
call sread
mov eax, x
call atoi
mov [x],eax

mov eax,msg_a
call sprint
mov ecx,a
mov edx,80
call sread
mov eax,a
call atoi
mov [a],eax

mov eax,[x]
mov ebx,[a]
cmp eax,ebx
je equal_branch

mov ecx,5
mul ecx
mov [res],eax
jmp fin

equal_branch:
add eax,ebx
mov [res],eax

fin:
mov eax,msg_res
call sprint
mov eax,[res]
call iprintLF
call quit