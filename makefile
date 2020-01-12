ROOT_DEV= FLOPPY 
AS86= as86 -0 -a
LD86= ld86 -0
all:Image
Image:bootsect
	@dd bs=32 if=bootsect of=Image skip=1
	@dd bs=512 if=setup of=Image seek=1
bootsect:bootsect.s
	@$(AS86) -o bootsect.o bootsect.s
	@$(LD86) -s -o bootsect bootsect.o
setup:setup.s
	@$(AS86) -o setup.o setup.s
	@$(LD86) -s -o setup setup.o
clean:
	@rm *.o Image bootsect
