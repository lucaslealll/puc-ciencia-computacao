#include<stdio.h>

main()
{
    printf("\nGerando valores aleatórios entre 0~100 com srand\n");

    /*
    srand(time(NULL)) objetiva inicializar o gerador de números aleatórios
    com o valor da função time(NULL). Este por sua vez, é calculado
    como sendo o total de segundos passados desde 1 de janeiro de 1970
    até a data atual.
    Desta forma, a cada execução o valor da "semente" será diferente.
    */
    srand(time(NULL));

    for(int i = 0; i < 5; i++)
    {
        int valor = rand() % 100; // % 100 significa a faixa de valores

        printf("\n%dº valor gerado: %d", i+1, valor);
    }
    printf("\n\n");
}