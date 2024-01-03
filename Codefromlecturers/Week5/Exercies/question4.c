#include <stdio.h>


int main(void)
{

    int total = 0;
    int R0 = 2;
    int R1 = 3;

    for (int i = 0; i < R1; i++) {
        total = total + R0;
    }

    printf("%d\n", total);

    return 0;
}