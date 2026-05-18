SRC = \
	src/ft_strlen.s \
	src/ft_strcpy.s \
	src/ft_strcmp.s \
	src/ft_write.s \
	src/ft_read.s \
	src/ft_strdup.s

OBJ = $(SRC:.s=.o)

NAME = libasm.a

.PHONY: all test run clean fclean re

all: $(NAME)

%.o: %.s
	nasm -f elf64 $< -o $@

$(NAME): $(OBJ)
	ar rcs $@ $^
	ranlib $@

test: tests/main.c $(NAME)
	@gcc -m64 tests/main.c -L . -l asm -I inc -o libasm
	@./libasm

run:
	@./libasm

clean:
	rm -f $(OBJ)

fclean: clean
	rm -f $(NAME) libasm

re: fclean all

