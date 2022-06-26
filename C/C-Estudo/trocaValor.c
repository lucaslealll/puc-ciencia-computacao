#include <stdio.h>
#include <stdlib.h>

main()
{
    int a = 1, b = 2,
        c = 3, d = 4,
        aux;

    printf("\nA = %d", a); // 1
    printf("\r\t");
    printf("B = %d", b); // 2

    printf("\nC = %d", c); // 1
    printf("\r\t");
    printf("D = %d", d); // 2

// COM VARIAVEL AUXILIAR
    printf("\n\nTroca com variavel auxiliar:");

    aux = a;    // aux  = 1
    a   = b;    // a    = 20
    b   = aux;  // b    = aux

    printf("\nA vale: %d", a);
    printf("\nB vale: %d", b);

// SEM VARIAVEL AUXILIAR 
    printf("\n\nTroca sem variavel auxiliar:");
    
    c = c + d; // c = 3 + 4; c = 7
    d = c - d; // d = 7 - 4; d = 3
    c = c - d; // c = 7 - 3; c = 4
     
    printf("\nC vale: %d", c);
    printf("\nD vale: %d\n\n", d);
}