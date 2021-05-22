
	[org 0x7c00] ;this basically tells the origin of the bootcode which 0x7c00;

;print character;	
	;mov ah,0x0e teletype output;
	;mov al,'T'  ;character to print;
	;mov ax,0x0e54 ; here we can use this line instead of the above two lines 0x54-'T' in ascii;
	;int 0x10    ;bios video interrupt;

;print string;

	mov ah,0x0e
	
	mov bx, teststring
	call printstring
	
	mov bx, teststring1
	call printstring
	
	jmp end_pgm

%if 0 ;just for multi line comment

	;mov al, [bx]
	int 0x10
	 
	mov al,[bx+1]
	int 0x10

	mov al,[bx+2]
	int 0x10
	
	mov al,[bx+3]
	int 0x10
	
	mov al,[bx+4]
	int 0x10
	
	mov al,[bx+5]
	int 0x10 
%endif ;0

printstring:
	 mov al, [bx]
	 cmp al,0
	 je end_print
	 int 0x10
	 add bx,1
	 jmp printstring

end_print:
	 ret


teststring: db 'SANJAM',0xa,0xd,0  ;0xa is newline in ascii to move to new line;
teststring1: db 'MYOS',0 ;0x0 is null to terminate the string;

end_pgm:

	jmp $           ;this jumps in the current address;
	
	times 510 - ($ - $$) db 0          ;$->current address, $$->base address and the operation does a padding of zeroes; 
	

	dw 0xAA55               ;data write(dw) magic numbers into 510 and 512 byte;



