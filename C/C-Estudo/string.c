#include <stdio.h>

#define TAM_STRING 20

int main()
{
    char string[TAM_STRING];
    system("clear");

    printf("\nRecebendo e formatando uma string [tira o enter]\n\n");

    printf("Digite o texto: ");
    fgets(string, TAM_STRING, stdin);

    // Tira o 'enter' do final da string
    // strlen mede o tamanho da string
    // string[no tamanho dela -1] coloca o ponto final(\0)
    string[strlen(string) - 1] = '\0';

    printf("%s", string);
}
