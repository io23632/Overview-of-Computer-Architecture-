#include <stdio.h>


int mult(int width, int height);

int main(void)
{

int result = mult(5, 3);

printf("%d\n", result);

   return 0;
}


int mult(int width, int height) 
{
    int area = 0; 
    while (height > 0){
        area = area + width;
        height--;
    }
    return area;
}