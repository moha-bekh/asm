FILE ?= main
LINKER ?= x86_64-linux-gnu-ld
RUNNER ?=

all: build
	$(RUNNER) ./$(FILE)

qemu: build
	qemu-x86_64 ./$(FILE)

build:
	nasm -f elf64 -g -F dwarf $(FILE).s -o $(FILE).o
	$(LINKER) $(FILE).o -o $(FILE)

debug-server: build
	qemu-x86_64 -g 1234 ./$(FILE)

debug-run:
	qemu-x86_64 -g 1234 ./$(FILE)

gdb:
	pwndbg -x x86_64-qemu.gdb ./$(FILE)

valgrind: build
	valgrind --leak-check=full --show-leak-kinds=all --track-origins=yes ./$(FILE)

clean:
	rm -f *.o $(FILE)
