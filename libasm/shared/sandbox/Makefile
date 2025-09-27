SRC = main.s
TARGET = main.o
BIN = main

all: compile link run

compile:
	nasm -f elf64 $(SRC) -o $(TARGET)

link:
	ld $(TARGET) -o $(BIN)

run:
	@./$(BIN)

clean:
		rm -f $(TARGET) $(BIN)
