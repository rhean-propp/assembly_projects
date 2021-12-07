/*
    gcc stacks.c -m32 -o stacks32 -g -fno-pie
    gcc stacks.c -o stacks64 -g -fno-pie
*/

#include<stdio.h>


int function2(int arg6, int arg7)
{
	int temp = arg7 - arg6;
	return temp;
}

int function1(int arg1, int arg2, char arg3, char arg4, short int arg5)
{
	return function2(arg1 + arg2, arg3 + arg4) + arg5;
}

int main()
{
	int local1 = 100;
	int local2 = 0x11223344;
	char local3 = 0x64;
	char local4 = 200;
	short int local5 = 0x7788;
	
	local1 = function1(local1, local2, local3, local4, local5);
	
	return 0;
}