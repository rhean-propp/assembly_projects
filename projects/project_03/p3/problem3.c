#include<stdio.h>

int funct1(int var4, int var3, int var2)
{

    printf("Entered function1\n");

    var2 = var2 & 0xA;
    var4 = var4 | var2;
    var4 = var4 & 0x28;
    var4 = var4 + var4;

    return(var4);

}

void funct2(int *p3, int *p4, int *p1)
{
    printf("First value: %#x + second val: %#x = %#x\n", *p3, *p4, *p3 + *p4);
}

int main()
{
    
    printf("Entered Main\n");

    
    int var1 = 0x1248;      // mov DWORD [rbp-0x18], 0x1248
    int var2 = 0x54;        // mov DWORD [rbp-0xc], 0x54
    int var3 = 0x1234;      // mov DWORD [rbp-0x14], 0x1234
    int var4 = 0x2345;      // mov DWORD [rbp-0x10], 0x2345
    

    var1 = funct1(var4, var3, var2);

    funct2(&var3, &var4, &var1);

    printf("Exiting program\n");
    
    return 0;
}