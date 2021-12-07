#include<stdio.h>
#include<stdlib.h>

int additup(int a, int b, int c)
{

    b = b & 10;     // and
    c = c & 20;     // and
    c = b | c;      // or
    a = a & 40;     // and
    a = a + c;      // add
    
    return a;
}

int main()
{
    int a = 60;
    int b = 170;
    int c = 54;
    int d = 200;

    a = additup(a, b, c);

    printf("My answer is >> Dec: %d Hex: %#x", a, a);

    return 0;
}