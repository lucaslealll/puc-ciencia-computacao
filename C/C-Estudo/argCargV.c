#include <stdio.h>
#include <stdlib.h>

// argc se trata da quantidade de argumentos que o SO operacionou
// argv se trata do nome do argumento

int main(int argc, char const *argv[])
{
    int i;

    printf("\nTotal de argumentos[argc] vindos do SO = %d\n", argc);

    for (i = 0; i < argc; i++) // enquanto o laço for menor que a quantidade de argumentos
    {
        printf("\nArgumento %d = %s", i, argv[i]);
    }
    printf("\n\nReexecute o codigo colocando mais argumentos na linha de comando ;-)");
    printf("\n\n");
}