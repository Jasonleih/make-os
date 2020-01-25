section bootsect vstart=0x7c00
mov ac,0x0600
mov bx,0x0700
mov cx,0
mov dx,0x184f
int 0x10
mov ax,0xb800
mov gs,ax
mov byte [gs:0x00],'h'
mov byte [gs:0x02],'e'
mov byte [gs:0x04],'l'
mov byte [gs:0x06],'l'
mov byte [gs:0x08],'o'
times 510-($-$$) db 0
db 0x55,0xAA 
