#include <stdio.h>

#define ROW 2
#define COLUMN 3

int main()
{
    system("clear");

    int matriz[ROW][COLUMN]; // cria a matriz
    int *ptr;                // PONTEIRO ptr

    printf("\nCriando e gerando dados aleatórios para uma matriz 2x3...\n");

    srand(time(NULL));

    // GERANDO DADOS ALEATORIOS PARA A MATRIZ
    for (int i = 0; i < ROW; i++) // PERCORRE AS LINHAS
    {
        for (int j = 0; j < COLUMN; j++) // PERCORRE AS COLUNAS
        {
            matriz[i][j] = rand() % 10;
            printf("%.2d ", matriz[i][j]);
            
            fflush(stdout); system("sleep 1");
        }
    }

    // APRESENTANDO DADOS UTILIZANDO PONTEIRO
    // CIMA PARA BAIXO

    ptr = matriz; // PONTEIRO ptr RECEBE A MATRIZ

    printf("\n\nApresentando dados de cima para baixo...\n");
    for (int i = 0; i < ROW; i++)
    {
        for (int j = 0; j < COLUMN; j++)
        {
            printf("%d ", *ptr);
            ptr++;
            
            fflush(stdout); system("sleep 1");
        }
        printf("\n");
    }

    // BAIXO PARA CIMA

    ptr = &matriz[ROW-1][COLUMN-1]; // PONTEIRO ptr RECEBE O LOCAL DE MEMORIA FINAL DA MATRIZ
    
    printf("\nApresentando dados de baixo para cima...\n");
    for (int i = 0; i < ROW; i++)
    {
        for (int j = 0; j < COLUMN; j++)
        {
            printf("%d ", *ptr);
            ptr--;
            
            fflush(stdout); system("sleep 1");
        }
        printf("\n");
    }
}