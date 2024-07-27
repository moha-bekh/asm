NASM = nasm -f elf64
AR = ar rcs

SRCS = ft_strlen.s
OBJS = $(SRCS:.s=.o)

NAME = libasm.a

all: $(NAME)

$(NAME): $(OBJS)
	$(AR) $(NAME) $(OBJS)

%.o: %.s
	$(NASM) $<

main:
	$(NASM) main.s -o main.o
	ld main.o -o main -L . -l asm

clean:
	rm -f $(OBJS)
	rm -f main.o

fclean: clean
	rm -f $(NAME)
	rm -f main

re: fclean all

.PHONY: all clean fclean re