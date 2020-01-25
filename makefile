ROOT_DEV= FLOPPY 
AS86= as86 -0 -a
LD86= ld86 -0
all:Image
Image:bootsect
	@dd  if=bootsect of=Image
#	@dd  bs=512 if=setup of=Image seek=1
bootsect:bootsect.s
	@$(AS86) -o bootsect.o bootsect.s
	@$(LD86) -s -o bootsect bootsect.o
	@dd bs=32 if=bootsect of=bootsect skip=1
clean:
	@rm *.o Image bootsect 
