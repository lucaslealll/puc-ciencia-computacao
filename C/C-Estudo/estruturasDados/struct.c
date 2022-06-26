#include <stdio.h>

struct pessoa
{
    char nome[20];
    int idade;
};

main()
{
    struct pessoa aluno;

    printf("Digite o nome do aluno: ");
    fgets(aluno.nome, 20, stdin);

    printf("Digite a idade do aluno: ");
    scanf("%d", &aluno.idade);
    getchar();

    printf("\n%s", aluno.nome);
    printf("%d\n", aluno.idade);
}