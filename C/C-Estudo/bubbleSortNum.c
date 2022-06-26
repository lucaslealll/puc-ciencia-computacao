#include <stdio.h>

#define TAM 3

int main()
{
    int vetor[5];

    printf("\nMetodo de Ordenacao - BubbleSort\n\n");

    printf("Gerando valores aleatórios para um vetor\n");

    srand(time(NULL));

// PRINTA VETOR GERADO
    for (int i = 0; i < TAM; i++)
    {
        system("sleep 1");

        vetor[i] = rand() % 50;
        printf("%d ", vetor[i]);

        fflush(stdout);
    }

    bubbleSort(vetor);

// PRINTA VETOR ORDENADO   
    printf("\n\nVetor ordenado:\n");
    for (int i = 0; i < TAM; i++)
    {
        system("sleep 1");

        printf("%d ", vetor[i]);

        fflush(stdout);
    }
    printf("\n");
}

void bubbleSort(int vet[])
{
    int i, j, aux;

    for (i = 0; i < TAM; i++) // PERCORRE O VETOR ATE O PENULTIMO NUMERO
    {
        for (j = TAM - 1; j > i; j--) // PASSA O VALOR, SE FOR MENOR, PARA A POSICAO DA FRENTE
        {
            if (vet[j] < vet[j - 1])
            {
                aux         = vet[j];
                vet[j]      = vet[j - 1];
                vet[j - 1]  = aux;
            }
        }
    }
}
