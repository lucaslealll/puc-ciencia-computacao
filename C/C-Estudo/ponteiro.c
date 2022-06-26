#include <stdio.h>

main()
{
    system("clear");
    printf("\n-> Explicando ponteiros (->, *)\n\n");

    printf("O '*' indica que a variavel escrita na frente dele refere-se a um ponteiro.");
    printf("\n\tint *ptr");
    printf("\n\tptr = d");

    printf("\n\nO '&' mostra o endereço de memoria que a variavel ocupa.");
    printf("\n\tscanf (\"%%d\", &d)");
    printf("\n\nAqui, o valor de 'd' é armazenado na variavel ptr");

    printf("\n\n-> Exemplo pratico utilizando as variaveis acima:\n");

    int *ptr, d;

    printf("\nDigite um valor para 'd'\n-> ");
    scanf("%d", &d);

    ptr = d;

    printf("\nValor(d)     de  'd'    = %d", d);
    printf("\nEndereço(&)  de  'd'    = %x", &d);
    printf("\nValor(ptr)   de  'ptr'  = %d", ptr);
    printf("\nEndereço(&)  de  'ptr'  = %x\n\n", &ptr);
}
