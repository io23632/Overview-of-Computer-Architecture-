#include <stdio.h>


int main(void){
   
   int total = 0;
   int n = 5;

   for (int i = 0; i <= 5; i++){
       total = total + n;
       n--;
   }
    printf("%d\n", total);
    
return 0;
}