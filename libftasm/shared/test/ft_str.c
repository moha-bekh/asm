#include "../inc/main.h"

void _strlen(void) {
  printf("***************** ft_strlen *****************\n\n");
  char *tests[] = {
      "",              // chaîne vide
      "A",             // une lettre
      "Hello, World!", // chaîne normale
      "1234567890",    // chiffres
      "With spaces!",  // espaces
      "Line\nBreak",   // caractères spéciaux
      "😊🌍",          // UTF-8 (note: strlen compte bytes)
      NULL             // fin de tableau
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
