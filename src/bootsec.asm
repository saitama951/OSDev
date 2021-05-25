
	[org 0x7c00] ;this basically tells the origin of the bootcode which 0x7c00;
	
	
	mov ah, 0x0B
	mov bh, 0x00
	mov bl, 0x01
	int 0x10

;print character;	
	;mov ah,0x0e teletype output;
	;mov al,'T'  ;character to print;
	;mov ax,0x0e54 ; here we can use this line instead of the above two lines 0x54-'T' in ascii;
	;int 0x10    ;bios video interrupt;

;print string;

	
	mov bx, teststring
	call printstring
	
	mov bx, teststring1
	call printstring

	mov dx, 0x12AB
	call print_hex
	
	jmp $
	
	%include "print_string.asm"
	%include "print_hex.asm"

teststring: db 'SANJAM',0xa,0xd,0  ;0xa is newline in ascii to move to new line;
teststring1: db "Hex test",0xa,0xd,0 ;0x0 is null to terminate the string;


	
	times 510 - ($ - $$) db 0          ;$->current address, $$->base address and the operation does a padding of zeroes; 
	

	dw 0xAA55               ;data write(dw) magic numbers into 510 and 512 byte;



