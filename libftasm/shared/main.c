#include "inc/main.h"

#include "test/ft_is.c"
void ft_is() {
  _isascii();
  _isalpha();
  _isdigit();
  _isprint();
  _isspace();
  _isalnum();
}

#include "test/ft_to.c"
void ft_to() {
  _swap();
  _tolower_();
  _toupper_();
  _atoi();
}

int main(int ac, char **av) {
  // ft_is();
  // ft_to();
  char hello[] = "Hello World!";
  int len = ft_strlen(hello);
  printf("Length of '%s' is %d\n", hello, len);
  return 0;
}
