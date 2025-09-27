#include "../inc/main.h"
#include <stdlib.h>

void _swap(void) {
  printf("***************** ft_swap *****************\n\n");
  int x = 10;
  int y = 20;
  printf("Before swap: x = %d, y = %d\n", x, y);
  ft_swap(&x, &y);
  printf("After swap:  x = %d, y = %d\n\n", x, y);
}

void _tolower_(void) {
  char hello[] = "HELLO woRLD! !@#$%";
  printf("before: tolower: %s\n", hello);
  for (int i = 0; hello[i]; i++) {
    hello[i] = ft_tolower(hello[i]);
  }
  printf("after: tolower: %s\n\n", hello);
}

void _toupper_(void) {
  char hello[] = "allo la TErre! !@#$%";
  printf("before: toupper: %s\n", hello);
  for (int i = 0; hello[i]; i++) {
    hello[i] = ft_toupper(hello[i]);
  }
  printf("afer: toupper: %s\n\n", hello);
}

void _atoi(void) {
  const char *strs[] = {"42",
                        "    12",
                        "4193 with words",
                        "words and 987",
                        "-91283472332",
                        "2147483647",  // INT_MAX
                        "-2147483648", // INT_MIN
                        "2147483648",  // Overflow
                        "-2147483649", // Underflow
                        "0",
                        "+1",
                        NULL};

  printf("***************** ft_atoi *****************\n\n");
  for (int i = 0; strs[i] != NULL; i++) {
    int _atoi = atoi(strs[i]);
    int result = ft_atoi(strs[i]);
    printf("atoi(\"%s\") = %d\n", strs[i], _atoi);
    printf("ft_atoi(\"%s\") = %d\n", strs[i], result);

    if (_atoi != result && !(_atoi && result))
      printf("\t❌ Mismatch!\n");
    else
      printf("\t✅ OK\n");
  }
  printf("\n");
}
