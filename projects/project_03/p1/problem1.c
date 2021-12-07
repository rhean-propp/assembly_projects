#include <stdio.h>

int main()
{
    long int c, x = 0, y = 1, s = 0;
    
    printf("Please enter a number: ");
    scanf("%ld", &c);
    
    printf("Fib Numbers\n");
    
    while(c != 0 ) {
        printf("%d\n",x);
        s = y+x;
        x = y;
        y = s;
        c--;
    }
}