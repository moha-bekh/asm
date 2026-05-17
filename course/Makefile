FILE ?= main
LD ?= ld
RUNNER ?=

all: build
	$(RUNNER) ./$(FILE)

build:
	nasm -f elf64 -g -F dwarf $(FILE).s -o $(FILE).o
	$(LD) $(FILE).o -o $(FILE)

clean:
	rm -f *.o $(FILE)
