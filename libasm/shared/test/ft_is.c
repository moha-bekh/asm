#include "../inc/libasm.h"

void _isalnum(void) {
  printf("***************** ft_isalnum *****************\n\n");
  char tests[] = {'H', 'X', '0', '5', '9', ':', '\n', '\t', 127, 128, -2, '\0'};

  for (int i = 0; tests[i] != '\0'; i++) {
    char c = tests[i];
    int res_std = isalnum(c);
    int res_asm = ft_isalnum(c);

    printf("Test %d: '%c' (ASCII %d)\n", i + 1, c, c);
    printf("\tisalnum \t= %d\n", res_std);
    printf("\tft_isalnum \t= %d\n", res_asm);

    if (res_std != res_asm && !(res_std && res_asm))
      printf("\t❌ Mismatch!\n");
    else
      printf("\t✅ OK\n");

    printf("\n");
  }
}

void _isalpha(void) {
  printf("***************** ft_isalpha *****************\n\n");
  char tests[] = {'H', 'X', '0', '\0'};

  for (int i = 0; tests[i] != '\0'; i++) {
    char c = tests[i];
    int res_std = isalpha(c);
    int res_asm = ft_isalpha(c);

    printf("Test %d: '%c' (ASCII %d)\n", i + 1, c, c);
    printf("\tisalpha\t= %d\n", res_std);
    printf("\tft_isalpha\t= %d\n", res_asm);

    if (res_std != res_asm && !(res_std && res_asm))
      printf("\t❌ Mismatch!\n");
    else
      printf("\t✅ OK\n");

    printf("\n");
  }
}

void _isascii(void) {
  char tests[] = {'H', 'X', '0', 128, -2, '\0'};
  for (int i = 0; tests[i] != '\0'; i++) {
    char c = tests[i];
    int res_std = isascii(c);
    int res_asm = ft_isascii(c);

    printf("Test %d: '%c' (ASCII %d)\n", i + 1, c, c);
    printf("\tisascii \t= %d\n", res_std);
    printf("\tft_isascii \t= %d\n", res_asm);

    if (res_std != res_asm && !(res_std && res_asm))
      printf("\t❌ Mismatch!\n");
    else
      printf("\t✅ OK\n");

    printf("\n");
  }
}

void _isdigit(void) {
  printf("***************** ft_isdigit *****************\n\n");
  char tests[] = {'H', 'X', '0', '5', '9', ':', '\0'};

  for (int i = 0; tests[i] != '\0'; i++) {
    char c = tests[i];
    int res_std = isdigit(c);
    int res_asm = ft_isdigit(c);

    printf("Test %d: '%c' (ASCII %d)\n", i + 1, c, c);
    printf("\tisdigit \t= %d\n", res_std);
    printf("\tft_isdigit \t= %d\n", res_asm);

    if (res_std != res_asm && !(res_std && res_asm))
      printf("\t❌ Mismatch!\n");
    else
      printf("\t✅ OK\n");

    printf("\n");
  }
}

void _isprint(void) {
  printf("***************** ft_isprint *****************\n\n");
  char tests[] = {'H', 'X', '0', '5', '9', ':', '\n', '\t', 127, 128, -2, '\0'};

  for (int i = 0; tests[i] != '\0'; i++) {
    char c = tests[i];
    int res_std = isprint(c);
    int res_asm = ft_isprint(c);

    printf("Test %d: '%c' (ASCII %d)\n", i + 1, c, c);
    printf("\tisprint \t= %d\n", res_std);
    printf("\tft_isprint \t= %d\n", res_asm);

    if (res_std != res_asm && !(res_std && res_asm))
      printf("\t❌ Mismatch!\n");
    else
      printf("\t✅ OK\n");

    printf("\n");
  }
}

void _isspace(void) {
  printf("***************** ft_isspace *****************\n\n");
  char tests[] = {'H',  'X', '0', '5', '9', ':', '\n',
                  '\t', ' ', 127, 128, -2,  '\0'};

  for (int i = 0; tests[i] != '\0'; i++) {
    char c = tests[i];
    int res_std = isspace(c);
    int res_asm = ft_isspace(c);

    printf("Test %d: '%c' (ASCII %d)\n", i + 1, c, c);
    printf("\tisspace \t= %d\n", res_std);
    printf("\tft_isspace \t= %d\n", res_asm);

    if (res_std != res_asm && !(res_std && res_asm))
      printf("\t❌ Mismatch!\n");
    else
      printf("\t✅ OK\n");

    printf("\n");
  }
}
