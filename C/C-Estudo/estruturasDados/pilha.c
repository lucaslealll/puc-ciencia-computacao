#include <stdio.h>
#include <stdlib.h>

// nós da pilha. contem os dados armazenados
struct no
{
    int dado;
    struct no *prox;
};

// estrutura pilha. é considerado a caixa que esta no topo
typedef struct
{
    struct no *topo;
} pilha;

// CRIA - cria pilha. define o topo dela como vazio
    void criaPilha(pilha *stack)
    {
        stack->topo = NULL;
    }

// EMPILHA - coloca dados na pilha
    void empilha(pilha *stack, int valor)
    {
        struct no *aux; // define um auxiliar para poder armazenar dados

        // aux recebe a formatacao de uma struct no e aloca espaco do tamanho da struct
        aux = (struct no *)malloc(sizeof(struct no));

        if (aux == NULL)
            return 0;

        aux->dado = valor;       // dado de aux recebe o valor
        aux->prox = stack->topo; // o proximo de aux é o topo da pilha
        stack->topo = aux;       // o topo da pilha é o aux
    }





// MOSTRA
    void mostraPilha(pilha stack)
    {
        struct no *aux; // variavel auxiliar

        aux = stack.topo; // aux é o topo da pilha

        if (aux == NULL)
            printf("\n\nPilha vazia\n\n");
        else
        {
            printf("\n\nPilha:\n");
            while (aux != NULL) // enquando nao chegar na base da pilha (chao)
            {
                printf("%d\n", aux->dado);
                aux = aux->prox;
            }
        }
    }

// DESEMPILHA
    int desempilha(pilha *stack, int *valor)
    {
        struct no *aux;

        aux = stack->topo;
        aux->dado = valor;
        stack->topo->prox = stack->topo;
        aux->dado = 0;
        aux->prox = NULL;

        free(aux);
        return 1;
    }

// PILHA VAZIA
    int pilhaVazia()
    {
        if (stack->topo == NULL)
            return 1;
        return 0;
    }

main()
{
    system("clear");

    pilha stack;
    int valor, numero;

    criaPilha(&stack);

    srand(time(NULL));
    for (int i = 0; i < 3; i++)
    {
        printf("Digite o %dº valor: ", i+1);
        scanf("%d", &numero);
        getchar();

        empilha(&stack, numero);
    }
    mostraPilha(stack);
}
