all: compile link run

compile:
	nasm -f bin boot.asm -o boot.bin
	nasm -f bin kernel.asm -o kernel.bin
	nasm -f bin init.asm -o init.bin
link:
	cp boot.bin os.bin
	cat kernel.bin >> os.bin
	cat init.bin >> os.bin

run:
	qemu-system-x86_64 -fda os.bin