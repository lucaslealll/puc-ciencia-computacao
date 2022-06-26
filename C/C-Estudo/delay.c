#include<stdio.h>

void delay(float segundos)
{
    int contador = 0;
    while(contador < segundos)
    {
        system("sleep 1");
        contador++;
    }
}

main()
{
    float segundos;
    
    printf("\nGerando delay no programa");

    printf("\n\nDelay de quantos segundos? ");
    scanf("%f",&segundos);

    for(int i = 0; i < 26; i++)
    {
        printf("%c%c ", 65+i, 97+i);
        fflush(stdout);
        delay(segundos);
    }
    printf("\n\n");
}
