;;;print hexadecimal

;;; ascii '0'-'9' = hex 0x30-0x39
;;; ascii 'A'-'F' = hex 0x41-0x46
;;; ascii 'a'-'f' = hex 0x61-0x66

print_hex:
	pusha
	mov cx, 0

hex_loop:
	cmp cx, 4 ;loop counter;
	je end_hexloop

	mov ax,dx
	and ax,0x000F
	add al,0x30
	cmp al,0x39
	jle movebx
	add al,0x7

movebx:
	mov bx,hexstring+5
	sub bx,cx
	mov [bx],al
	ror dx,4

	add cx,1
	jmp hex_loop
	

end_hexloop:
	mov bx,hexstring
	call printstring

	popa
	ret

hexstring: db "0x0000",0
