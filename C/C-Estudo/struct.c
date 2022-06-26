#include <stdio.h>

#define TAM_STRING 20

struct estruturaLivro
{
    char    nome[TAM_STRING];
    char    autor[TAM_STRING];
    int     ano;
    float   preco;
};

void formataString(char str[TAM_STRING])
{
    // Tira o 'enter' do final da string
    str[strlen(str) - 1] = '\0';
}

int main()
{
    struct estruturaLivro livro;
    system("clear");

    printf("\n--------- Preenchendo 'struc' ---------\n\n");

// INSERE O DADOS DO LIVRO
    printf("Nome  do livro: ");
    fgets(livro.nome, TAM_STRING, stdin);
    formataString(livro.nome);

    printf("Autor do livro: ");
    fgets(livro.autor, TAM_STRING, stdin);
    formataString(livro.autor);

    printf("Ano   do livro: ");
    scanf("%d", &livro.ano);

    printf("Preco do livro: ");
    scanf("%f", &livro.preco);

// SAIDA DE DADOS DO LIVRO

    printf("\n--------- Dados ---------\n\n");

    printf("Livro '%s' - ",livro.nome);
    printf("Autor '%s' - ",livro.autor);
    printf("Ano '%d' - ",livro.ano);
    printf("Preco 'R$%.2f'\n\n",livro.preco);
}
