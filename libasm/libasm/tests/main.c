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

int main(void) {
  test_strlen();
  return 0;
}
