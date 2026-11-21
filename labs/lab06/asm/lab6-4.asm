%include 'in_out.asm'

  SECTION .data

   msg:  DB 'Введите x: ',0
   res:  DB 'Результат: ',0

  SECTION .bss
  x: RESB 80

  SECTION .text
  GLOBAL _start
   _start:

   ; ---- Ввод x
   mov eax, msg
   call sprint

   mov ecx, x
   mov edx, 80
   call sread

   mov eax,x
   call atoi

   ; ---- Вычисление
   mov ebx, eax ; EBX = x
   mul ebx ; EAX = x * x
   mul ebx ; EAX = x * x * x  (x^3)

   xor edx, edx ; обнуляем EDX для корректной работы div
   mov ebx, 2
   div ebx ; EAX = x^3 / 2

   add eax, 1 ; EAX = x^3 / 2 + 1

   ; ---- Вывод результата на экран
   mov edi, eax ; сохраняем результат в edi
   mov eax, res ; печать подписи
   call sprint
   mov eax, edi ; печать значения результата
   call iprintLF

   call quit