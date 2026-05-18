#include "../inc/libasm.h"

#include <errno.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

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

void test_strcmp(void) {
  printf("\n***************** ft_strcmp *****************\n\n");
  char *tests[][2] = {
      {"", ""},
      {"A", "A"},
      {"A", "B"},
      {"B", "A"},
      {"Hello", "Hello"},
      {"Hello", "Hellp"},
      {"Hellp", "Hello"},
      {"Hello", "Hello, World!"},
      {"Hello, World!", "Hello"},
      {"1234567890", "1234567890"},
      {"With spaces!", "With spaces?"},
      {"Line\nBreak", "Line\nBreak"},
      {"😊🌍", "😊🌎"},
      NULL};

  for (int i = 0; tests[i][0] != NULL; i++) {
    char *s1 = tests[i][0];
    char *s2 = tests[i][1];
    int ret_std = strcmp(s1, s2);
    int ret_asm = ft_strcmp(s1, s2);

    printf("Test %d: \"%s\" vs \"%s\"\n", i + 1, s1, s2);
    printf("\tstrcmp   = %d\n", ret_std);
    printf("\tft_strcmp= %d\n", ret_asm);

    if (ret_std != ret_asm)
      printf("\t❌ Mismatch!\n");
    else
      printf("\t✅ OK\n");

    printf("\n");
  }
}

void test_write(void) {
  printf("\n***************** ft_write *****************\n\n");
  char *tests[] = {
      "",
      "A",
      "Hello, World!",
      "1234567890",
      "With spaces!",
      "Line\nBreak",
      "😊🌍",
      NULL};

  for (int i = 0; tests[i] != NULL; i++) {
    int pipefd[2];
    char buf[100] = {0};
    char *s = tests[i];
    size_t len = strlen(s);

    if (pipe(pipefd) == -1) {
      perror("pipe");
      return;
    }

    ssize_t ret_asm = ft_write(pipefd[1], s, len);
    close(pipefd[1]);
    ssize_t read_ret = read(pipefd[0], buf, sizeof(buf) - 1);
    close(pipefd[0]);

    if (read_ret >= 0)
      buf[read_ret] = '\0';

    printf("Test %d: \"%s\"\n", i + 1, s);
    printf("\twrite bytes expected = %zu\n", len);
    printf("\tft_write            = %zd\n", ret_asm);
    printf("\tread back           = \"%s\"\n", buf);

    if (ret_asm != (ssize_t)len)
      printf("\t❌ Return value mismatch!\n");
    else if (strcmp(buf, s) != 0)
      printf("\t❌ Written content mismatch!\n");
    else
      printf("\t✅ OK\n");

    printf("\n");
  }

  errno = 0;
  ssize_t ret_std = write(-1, "bad fd", 6);
  int errno_std = errno;
  errno = 0;
  ssize_t ret_asm = ft_write(-1, "bad fd", 6);
  int errno_asm = errno;

  printf("Test invalid fd\n");
  printf("\twrite   = %zd, errno = %d\n", ret_std, errno_std);
  printf("\tft_write= %zd, errno = %d\n", ret_asm, errno_asm);

  if (ret_std != ret_asm || errno_std != errno_asm)
    printf("\t❌ Error handling mismatch!\n");
  else
    printf("\t✅ OK\n");

  printf("\n");
}

void test_read(void) {
  printf("\n***************** ft_read *****************\n\n");
  char *tests[] = {
      "",
      "A",
      "Hello, World!",
      "1234567890",
      "With spaces!",
      "Line\nBreak",
      "😊🌍",
      NULL};

  for (int i = 0; tests[i] != NULL; i++) {
    int pipefd[2];
    char buf[100] = {0};
    char *s = tests[i];
    size_t len = strlen(s);

    if (pipe(pipefd) == -1) {
      perror("pipe");
      return;
    }

    write(pipefd[1], s, len);
    close(pipefd[1]);
    ssize_t ret_asm = ft_read(pipefd[0], buf, sizeof(buf) - 1);
    close(pipefd[0]);

    if (ret_asm >= 0)
      buf[ret_asm] = '\0';

    printf("Test %d: \"%s\"\n", i + 1, s);
    printf("\tread bytes expected = %zu\n", len);
    printf("\tft_read            = %zd\n", ret_asm);
    printf("\tread buffer        = \"%s\"\n", buf);

    if (ret_asm != (ssize_t)len)
      printf("\t❌ Return value mismatch!\n");
    else if (strcmp(buf, s) != 0)
      printf("\t❌ Read content mismatch!\n");
    else
      printf("\t✅ OK\n");

    printf("\n");
  }

  errno = 0;
  char buf_std[10] = {0};
  ssize_t ret_std = read(-1, buf_std, sizeof(buf_std));
  int errno_std = errno;
  errno = 0;
  char buf_asm[10] = {0};
  ssize_t ret_asm = ft_read(-1, buf_asm, sizeof(buf_asm));
  int errno_asm = errno;

  printf("Test invalid fd\n");
  printf("\tread   = %zd, errno = %d\n", ret_std, errno_std);
  printf("\tft_read= %zd, errno = %d\n", ret_asm, errno_asm);

  if (ret_std != ret_asm || errno_std != errno_asm)
    printf("\t❌ Error handling mismatch!\n");
  else
    printf("\t✅ OK\n");

  printf("\n");
}

void test_strdup(void) {
  printf("\n***************** ft_strdup *****************\n\n");
  char *tests[] = {
      "",
      "A",
      "Hello, World!",
      "1234567890",
      "With spaces!",
      "Line\nBreak",
      "😊🌍",
      NULL};

  for (int i = 0; tests[i] != NULL; i++) {
    char *src = tests[i];
    char *ret_std = strdup(src);
    char *ret_asm = ft_strdup(src);

    printf("Test %d: \"%s\"\n", i + 1, src);
    printf("\tstrdup   = \"%s\" (%p)\n", ret_std, (void *)ret_std);
    printf("\tft_strdup= \"%s\" (%p)\n", ret_asm, (void *)ret_asm);

    if (ret_std == NULL || ret_asm == NULL)
      printf("\t❌ Allocation failed!\n");
    else if (strcmp(ret_std, ret_asm) != 0)
      printf("\t❌ Content mismatch!\n");
    else if (ret_asm == src)
      printf("\t❌ Return pointer is not a duplicate!\n");
    else
      printf("\t✅ OK\n");

    free(ret_std);
    free(ret_asm);
    printf("\n");
  }
}

int main(void) {
  test_strlen();
  test_strcpy();
  test_strcmp();
  test_write();
  test_read();
  test_strdup();
  return 0;
}
