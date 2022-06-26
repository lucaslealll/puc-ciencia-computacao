/*
Union É UMA ESTRUTURA DE DADOS QUE PERMITE AGRUPAR
DADOS DE DIFERENTES TIPOS COMO UM UNICO OBJETO DE DADOS;
- COMPARTILHAM O MESMO ESPAÇO DE ARMAZENAMENTO;
- LOGO, APENAS UM DADO PODE SER REFERENCIADO POR VEZ;
- A ESTRUTURA ALOCA O ESPAÇO DE MEMÓRIA DO TIPO QUE OCUPA
MAIOR MEMORIA (PARA PODER REPRESENTAR TODOS);
*/

#include<stdio.h>

// UNION QUE PODE ARMAZENAR VALORES INTEIROS E FLUTUANTES
union teste
{
    int     a;
    float   b;
};

main()
{
    int valor;
    union teste un01;

// ATRIBUINDO VALORES
    un01.a = 15;
    un01.b = 25.7;

    printf("\nAtribuindo valores SIMULTANEAMENTE na 'union'");

    printf("\n\tValor a = %d", un01.a);
    printf("\n\tValor b = %.2f\n", un01.b);
    printf("\nQUANDO DECLARADO SIMULTANEAMENTE, SO O ULTIMO VALOR É ATRIBUIDO!!!");
    getchar();

    printf("\nAtribuindo valores RESPECTIVAMENTE na 'union'");

    un01.a = 15;
    printf("\n\tValor a = %d", un01.a);

    un01.b = 25.7;
    printf("\n\tValor b = %.2f\n", un01.b);
}