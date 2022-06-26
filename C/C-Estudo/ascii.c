#include<stdio.h>
#include<stdlib.h>

main()
{
    system("clear");
    printf("\nTabela ASCII\n\n");

    printf("Char\tDec\tHex\n");
    
    for (int i = 0; i < 128; i++)
    {
        printf("%c\t%d\t%x", i, i, i);
        printf("\n");
    }
}