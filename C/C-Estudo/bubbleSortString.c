#include <stdio.h>
#include <string.h>

int main()
{
    char string[4][20] = {"Marli", "Ana", "Joana","Alice"};

    printf("\nMetodo de Ordenacao String- BubbleSort\n\n");

// PRINTA VETOR ORDENADO   
    printf("Nomes aleatórios...\n");

    for (int i = 0; i < 4; i++)
    {
        system("sleep 1");

        printf("%s ", string[i]);

        fflush(stdout);
    }
    printf("\n");

    printf("\nOrdenando nomes...\n");

    bubbleSortString(string, 4);

// PRINTA VETOR ORDENADO   
    for (int i = 0; i < 4; i++)
    {
        system("sleep 1");

        printf("%s ", string[i]);

        fflush(stdout);
    }
    printf("\n");
}

//  FUNCAO STRCMP
//  strcmp(s1,s2)
//  >  0, se s1 >  s2
//  <  0, se s1 <  s2
//  == 0, se s1 == s2

void bubbleSortString(char vet[][20], int tam)
{
    int i, j;
    char aux[20];

    for (i = 0; i < 4; i++) // PERCORRE O VETOR ATE O PENULTIMO NUMERO
    {
        for (j = 4 - 1; j > i; j--) // PASSA O VALOR, SE FOR MENOR, PARA A POSICAO DA FRENTE
        {
            if (strcmp(vet[j], vet[j-1]) < 0)
            {
                strcpy(aux, vet[j]);
                strcpy(vet[j], vet[j - 1]);
                strcpy(vet[j - 1], aux);
            }
        }
    }
}
