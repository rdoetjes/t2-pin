.model tiny

.data
pin:
db "PPPPP  IIIIIII   N    N"
db 10,13
db "P   PP    I      NN   N IDENTIFICATION"
db 10,13
db "P   PP    I      N N  N"
db 10,13
db "PPPPP     I      N  N N   PROGRAM"
db 10,13
db "P         I      N   NN"
db 10,13
db "P      IIIIIII   N    N"
db 10, 10, 13
db "Strike a key when ready ..."
db 10, 13, "$"
startcode: db 10, 10, 13, "12345678901234567890123457890123456780",10,13,"$"
pincode: db "9003",10,13,"$"
message: db 10,13,"PIN INDENTIFICATION NUMBER: 9003",10,10,13,"a>$"
prn dw 00

.code
	org 100h
main proc
	mov ah, 00
	mov al, 02
	int 10h
	lea dx, pin
	call print

	call keypress
	call scanPin
	call keypress

	mov ax, 4c00h
	int 21h
main endp

scanPin proc
	lea dx, startcode
	call print

	mov ch, 37;pos
	mov cl, 0 ;cnt

	mov bl, 0 ;j
	mov bh, 0 ;i
genCode:
	;print random number
	call rand
	call rangeRand
	mov ah,02h
	int 21h

	call delay

	; loop counter 38 to 4 positions
	inc bh
	cmp bh, ch
	jle genCode

	;print new line
	mov dl, 10
	mov ah, 02h
	int 21h
	mov dl, 13
	int 21h

	;loop counter 5 rows
	mov bh, 0
	inc bl
	cmp bl, 5
	jnz genCode
	mov bl,0

	;subtract 2 or 1 from position
	mov al, cl
	and al, 1
	jnz sub2
	dec ch
	jmp subc
sub2:
	sub ch, 2
subc:

	inc cl
	cmp ch, 4
	jge genCode

	mov cl, 10
	lea dx, pincode

pinloop:
	call print
	dec cl
	jnz pinloop
	lea dx, message
	call print

	ret
scanPin endp

rangeRand proc
	push cx

	;get random between 0-9
	xor dx, dx
	mov cx, 10
	div cx
	add dl, '0'

	pop cx
	ret
rangeRand endp

rand proc
	mov ax, 25173
	mul word ptr [prn]
	add ax, 13849
	mov [prn], ax

	ret
rand endp

delay proc
	push si
	mov si, 03ffh
__wait:
	dec si
	jnz __wait
	pop si
	ret
delay endp

print proc
	mov ah,09h
	int 21h
	ret
print endp

keypress proc
keyread:
	mov ah, 01h
	int 16h
	jz keyread
	mov ah,0h
	int 16h
	ret
keypress endp
end main
