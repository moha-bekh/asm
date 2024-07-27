all:
	nasm -f elf64 main.asm -o main.o
	ld main.o -o main

malloc:
	nasm -f elf64 malloc.asm -o malloc.o
	cc -no-pie -o malloc malloc.o -nostartfiles -lc
# ld malloc.o -o malloc

clean:
	rm -f main.o main
	rm -f malloc.o malloc

re: clean all