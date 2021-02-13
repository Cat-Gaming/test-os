# Prerequesites
Debian Based Systems:
```
sudo apt install qemu-system-x86 nasm make
```

Arch Based Systems:
```
sudo pacman -S qemu nasm make
```

# Building the OS
Just type:
```
make
```

# Running the OS
Running the Installer and Floppy:
```
make run
```
Running the HD File:
```
make boot_hd
```
Manually:
Floppy Disk:
```
qemu-system-x86_64 -fda os.bin
```
HD:
```
qemu-system-x86_64 -hda os_hd.img
```
Both Floppy and HD:
```
qemu-system-x86_64 -fda os.bin -hda os_hd.img
```