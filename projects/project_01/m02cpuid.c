#include<stdio.h>

int main() 
{

    int EAX, EBX, ECX, EDX, request_code;

    printf("Enter request code: ");
    scanf(" %d", &request_code);

    __asm__ volatile
    (
        "cpuid"
        : "=a"(EAX), "=b"(EBX), "=c"(ECX), "=d"(EDX)
        : "0"(request_code)
    );

    printf("Request Code: %x\nEAX: %x\nEBX: %x\nECX: %x\nEDX: %x", request_code, EAX, EBX, ECX, EDX);


    return 0;
}