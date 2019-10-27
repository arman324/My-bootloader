
; Created by Arman Riasi on 10/10/19.
; Copyright Â© 2019 Arman Riasi. All rights reserved.

[BITS 16]
[ORG 0x7C00]

mov ax,0x0000 ;set the value of the ax to 0
mov ds,ax ;set ds similar to ax
mov si,string ;set si to string
call print_all_string
jmp $

print_all_string:
mov ah,0x0E ;call the function of print
mov bh,0x00 ;set page number
mov bl,0x14 ;set the color of font to blue and red

print_next_char:
lodsb ;choosing one character from si, set the register and going forward one step
cmp al,0 ;eche turn compare al register with the zero number at the end of the string
jz end ;jump if zero to end
int 0x10 ;interrupt to CPU for printing on monitor
jmp print_next_char

end:
hlt

string: db 'Hi, Arman Riasi',0
