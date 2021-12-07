/* factorial fact(n) = n*(n-1)*...2*1 */
#include<stdio.h>
#include<stdlib.h>

int fact(int n)
{
    if(n == 0)
        return(1);
    return(n * fact(n-1));
}

int main()
{
    int n, m;
    while(1)
    {
        printf("Enter a number: ");
        scanf("%d", &n);

        m = fact(n);
        printf("The factorial of %d is %d\n", n, m);
    }
}