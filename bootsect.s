.globl begtext,begdata,begbss,endtext,enddata,endbss
.text
begtext:
.data
begdata:
.bss
begbss:
.text
bootseg=0x07c0
initseg=0x9000
setuplen=4
entry start
start:
	mov ax,#bootseg
	mov ds,ax
	mov ax,#initseg
	mov es,ax
	mov cx,#256
	sub si,si
	sub di,di
	rep
	movw
	jmpi go,initseg
go:	mov ax,cs
	mov ds,ax
	mov es,ax
	mov ss,ax
	mov sp,#0xFF00
load_setup:
	mov ch, #0x00
	seg cs
	mov sectors,cx
	mov ax,#initseg
	mov es,ax
	mov ah, #0x03
	xor bh,bh
	int 0x10
	mov cx, #24
	mov bx, #0x0007
	mov bp, #msg1
	mov ax, #0x1301
	int 0x10
loop_forever:	j loop_forever
sectors:
	.word 0
msg1:
	.byte 13,10
	.ascii "Loading system..."
	.byte 13,10,13,10
.org 510
boot_flag:
	.word 0xaa55
.text
endtext:
.data
enddata:
.bss
endbss:

