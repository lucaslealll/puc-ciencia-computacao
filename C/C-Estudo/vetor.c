#include <stdio.h>
#include <stdlib.h>

#define TAM_VET 10
main()
{
    int i, vet[TAM_VET] = {}, offset = 0, valorTotalVetor = 0;
    int *p = vet;

    system("clear");
    srand(time(NULL));
    
    printf("\nGerando valores aleatorios para o vetor...\n\n");
    
    printf("Valor\tEndereco(&)\tOffset\tConteudo do ponteiro(*p)\n");
    for (i = 0; i < TAM_VET; i++)
    {
        vet[i] = rand() % 100; // valores até 1000

        printf("%.2d\t%x", vet[i], &vet[i]);
        printf("\t%.2d", offset);
        printf("\t%.2d\n", *p);

        fflush(stdout);
        system("sleep 1");

        offset = offset + 4;
        valorTotalVetor = valorTotalVetor + vet[i];
        p++;
    }
    printf("\nO valor total do vetor e %d\n\n", valorTotalVetor);
}