//gcc -O3 -S -masm=intel -mtune=native aocii-asm-inline-ex2.c && code aocii-asm-inline-ex2.s

#include <stdio.h>
#include <stdlib.h>

// FUNCAO FAZ A SOMA DOS PARAMETROS X E Y
int soma(int x, int y);


int main()
{
    printf("Hello world!\n");
    printf("%d\n", soma(10, 15));
    return 0;
}

// n RECEBE O RESULTADO DA SOMA
// FUNÇÃO RETORNA O VALOR DO RESULTADO n
int soma(int x, int y)
{
    int n;
    n = x + y;
    return n;
}

// gcc --h
// gcc -O3 -S -masm=? -mtune=native -fverbose-asm main.c

// gcc -O3 -S -masm=att -mtune=native -fverbose-asm main.c
// gcc -O3 -S -masm=intel -mtune=native -fverbose-asm main.c

// -O3:             Nivel maximo de otimizacao
// -S:              Gera codigo assembly
// -masm=?:         Sintaxe padrao de geracao do codigo
// -mtune=native:   Processador nativo
// -fverbose-asm:   Inserção de comentários