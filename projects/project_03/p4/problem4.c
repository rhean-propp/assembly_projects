#include<stdio.h>

int length(char array[])
{
    int counter = 0;

    while(array[counter] != '\0')
        counter++;

    return counter;
}

void entangle(char array[20], char new_array[20], int size)
{

    int counter = 0;
    int flag = 0;

    while(size != 0)
    {
        if (array[counter] & 0xFF == 0 || new_array[counter] & 0xFF == 0)
            flag = 0;
        

        array[counter] = array[counter] ^ 0x22;

        if (array[counter] == new_array[counter])
        {
            flag = 1;
        }

        size--;
        counter++;
    }

    if (flag == 0)
    {
        printf("Match found\n");
    }
    printf("%s, %s", array, new_array);
    
}

int main()
{

    char array[20] = {"RCQUMPFQ"};

    printf("Entered Main\n");
    printf("Please enter a string:\n");

    char new_array[20] = {'\0'};

    scanf("%s", &new_array);

    int size = length(new_array);

    entangle(new_array, array, size);

    return 0;
}