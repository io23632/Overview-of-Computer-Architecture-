#include <stdio.h>
#include <string.h>

int fibonacci(int n) {
    int x, y = 0;
    static int times_called = 0;
    static int layers_deep = 0;
    static char tabs[100];
    tabs[2*layers_deep] = '|';
    tabs[2*layers_deep+1] = '\t';
    tabs[2*layers_deep+2] = '\0';
    layers_deep++;

    printf("%sfibonacci called with argument %d\n", tabs, n);
    times_called++;

    if (n == 0) {
        printf("%sReturning 0.\n", tabs);
        layers_deep--;
        tabs[2*layers_deep] = '\0';
        return 0;
    } if (n == 1) {
        printf("%sReturning 1.\n", tabs);
        layers_deep--;
        tabs[2*layers_deep] = '\0';
        return 1;
    }

    printf("%sFirst child call: \n", tabs);
    x = fibonacci(n-1);
    printf("%sSecond child call: \n", tabs);
    y = fibonacci(n-2);

    printf("%sReturning sum %d. Total calls: %d\n", tabs, x+y, times_called);
    layers_deep--;
    tabs[2*layers_deep] = '\0';
    return x+y;
}

int main() {
    setbuf(stdout, 0); // Makes printf work normally in CLion's debug mode
    fibonacci(5);

    return 0;
}