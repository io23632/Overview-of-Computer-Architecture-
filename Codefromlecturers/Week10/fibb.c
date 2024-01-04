#include <stdio.h>

int fib(int n);

int main (void)
{

    int result = fib(5);

    printf("%d\n", result);

    return 0;
}

int fib(int n){
    
if (n == 0) {
    return n;
}
if (n == 1 | n == 2) {
    return 1;
}

else {
    return fib(n-1) + fib(n-2);
    
}


}

