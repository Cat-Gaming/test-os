all: make_hd_img compile link run

compile:
	nasm -f bin boot.asm -o boot.bin
	nasm -f bin kernel.asm -o kernel.bin
	nasm -f bin init.asm -o init.bin
link:
	cp boot.bin os.bin
	cat kernel.bin >> os.bin
	cat init.bin >> os.bin

make_hd_img:
	rm os_hd.img
	qemu-img create os_hd.img 5k

run:
	qemu-system-x86_64 -fda os.bin -hda os_hd.img