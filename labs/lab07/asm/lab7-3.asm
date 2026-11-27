%include 'in_out.asm'
section .data
msg db 'Наименьшее число: ',0h

A dd '79'
B dd '83'
C dd '41'
section .bss
min resb 10

section .text
global _start
_start:

mov eax,A
call atoi
mov [min],eax
mov eax,B
call atoi

mov ecx,[min] ; 'ecx = A'
mov ecx,eax ; 'max = A'
jl check_C
mov [min],eax

check_C:
mov eax,C
call atoi
mov ecx,[min]
cmp ecx,eax
jl fin
mov [min],eax

fin:
mov eax, msg
call sprint
mov eax,[min]
call iprintLF
call quit