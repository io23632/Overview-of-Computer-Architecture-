#include <stdio.h>



int main(void){
    int i = 0;
    int temp = 0;
    int col = 64;
    while (temp < col) {
        temp = temp + 16;
        i++;
    }

    printf("%d\n", i);
}

