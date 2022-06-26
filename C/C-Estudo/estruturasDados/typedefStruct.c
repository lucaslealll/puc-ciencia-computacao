#include <stdio.h>

typedef struct
{
    char nome[20];
    int idade;
} pessoa;

main()
{
    pessoa aluno;

    printf("Digite o nome do aluno: ");
    fgets(aluno.nome, 20, stdin);

    printf("Digite a idade do aluno: ");
    scanf("%d", &aluno.idade);
    getchar();

    printf("\n%s", aluno.nome);
    printf("%d\n", aluno.idade);
}