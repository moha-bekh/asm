#include <unistd.h>

int main(void)
{
    int x = 10;
    int y = x + 10;

    char c = 'X';
    write(1, &c, 1);

    return 0;
}
