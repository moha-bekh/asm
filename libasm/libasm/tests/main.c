#include "../inc/libasm.h"

#include <stdio.h>
#include <string.h>

void test_strlen(void) {
  printf("\n***************** ft_strlen *****************\n\n");
  char *tests[] = {
      "",              // empty string
      "A",             // one character
      "Hello, World!", // string with punctuation
      "1234567890",    // numeric string
      "With spaces!",  // string with spaces
      "Line\nBreak",   // string with newline
      "😊🌍",          // string with emojis (multibyte characters)
      NULL             // null pointer (should be handled gracefully)
  };

  for (int i = 0; tests[i] != NULL; i++) {
    char *s = tests[i];
    size_t len_std = strlen(s);
    size_t len_asm = ft_strlen(s);

    printf("Test %d: \"%s\"\n", i + 1, s);
    printf("\tstrlen   = %zu\n", len_std);
    printf("\tft_strlen= %zu\n", len_asm);

    if (len_std != len_asm)
      printf("\t❌ Mismatch!\n");
    else
      printf("\t✅ OK\n");

    printf("\n");
  }
}

void test_strcpy(void) {
  printf("\n***************** ft_strcpy *****************\n\n");
  char *tests[] = {
      "",              // empty string
      "A",             // one character
      "Hello, World!", // string with punctuation
      "1234567890",    // numeric string
      "With spaces!",  // string with spaces
      "Line\nBreak",   // string with newline
      "😊🌍",          // string with emojis (multibyte characters)
      NULL};

  for (int i = 0; tests[i] != NULL; i++) {
    char dst_std[100] = "xxxxxxxxxxxxxxxx";
    char dst_asm[100] = "xxxxxxxxxxxxxxxx";
    char *src = tests[i];

    char *ret_std = strcpy(dst_std, src);
    char *ret_asm = ft_strcpy(dst_asm, src);

    printf("Test %d: \"%s\"\n", i + 1, src);
    printf("\tstrcpy   = \"%s\"\n", dst_std);
    printf("\tft_strcpy= \"%s\"\n", dst_asm);
    printf("\tret strcpy   = %p\n", (void *)ret_std);
    printf("\tret ft_strcpy= %p\n", (void *)ret_asm);

    if (strcmp(dst_std, dst_asm) != 0)
      printf("\t❌ Content mismatch!\n");
    else if (ret_asm != dst_asm)
      printf("\t❌ Return pointer mismatch!\n");
    else
      printf("\t✅ OK\n");

    printf("\n");
  }
}

int main(void) {
  test_strlen();
  test_strcpy();
  return 0;
}
