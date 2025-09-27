#ifndef LIBASM_H
#define LIBASM_H

#include <stddef.h>

int ft_isascii(int c);
int ft_isprint(int c);
int ft_isalpha(int c);
int ft_isdigit(int c);
int ft_isspace(int c);
int ft_isalnum(int c);

void ft_putchar_fd(char c, int fd);
void ft_putstr_fd(char *str, int fd);

void ft_bzero(void *ptr, size_t n);

void ft_swap(int *a, int *b);
int ft_tolower(int c);
int ft_toupper(int c);
int ft_atoi(const char *nptr);

size_t ft_strlen(const char *s);

#endif // LIBASM_H
