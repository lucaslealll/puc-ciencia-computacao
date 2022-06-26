//gcc -O3 -S -masm=intel -mtune=native aocii-asm-inline-ex3.c && code aocii-asm-inline-ex3.s

#include <stdio.h>

// FUNCAO FAZ A SOMA DOS PARAMETROS X E Y
int sum2(int x, int y);

int main()
{
    printf("%d\n", sum2(13, 5));
    return 0;
}

// r RECEBE O RESULTADO DA SOMA
// FUNÇÃO RETORNA O VALOR DO RESULTADO r
int sum2(int x, int y)
{
    int r;
    __asm__(
        // LOAD EFFECTIVE ADDRESS
        "lea (%1, %2), %[saida]"
        : [saida] "=r"(r)
        : "r"(x), "r"(y));
    return r;
}

// gcc --h
// gcc -O3 -S -masm=? -mtune=native -fverbose-asm main.c

// gcc -O3 -masm=att -mtune=native -fverbose-asm main.c
// gcc -O3 -masm=intel -mtune=native -fverbose-asm main.c

// -O3:             Nivel maximo de otimizacao
// -S:              Gera codigo assembly
// -masm=?:         Sintaxe padrao de geracao do codigo
// -mtune=native:   Processador nativo
// -fverbose-asm:   Inserção de comentários