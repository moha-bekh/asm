NASM = nasm
NASMFLAGS = -f elf64

CC = gcc
CFLAGS = -m64

ASRCS =	\
				src/ft_strlen.s \
				src/ft_strcpy.s \
				src/ft_strcmp.s \
				src/ft_write.s \
				src/ft_read.s \
				src/ft_strdup.s \

BSRCS =	\
				src/ft_atoi_base.s \
				src/ft_list_push_front.s \
				src/ft_list_size.s \
				src/ft_list_sort.s \
				src/ft_list_remove_if.s \

SRCS +=  \
				src/ft_isascii.s \
				src/ft_isprint.s \
				src/ft_isalpha.s \
				src/ft_isdigit.s \
				src/ft_isalnum.s \
				src/ft_isspace.s \
				\
				src/ft_putchar_fd.s \
				src/ft_putstr_fd.s \
				\
				src/ft_bzero.s \
				\
				src/ft_swap.s \
				src/ft_tolower.s \
				src/ft_toupper.s \
				src/ft_atoi.s \
				\
				src/ft_strlen.s

OBJS = $(SRCS:.s=.o)
NAME = libasm.a

all: $(NAME)

%.o: %.s
	$(NASM) $(NASMFLAGS) $< -o $@

$(NAME): $(OBJS)
	ar rcs $@ $^
	ranlib $@


main: main.c $(NAME)
	$(CC) $(CFLAGS) main.c -L . -l asm -I inc -o $@

run: main
	./main

clean:
	rm -f src/*.o $(NAME) main

re: clean all
