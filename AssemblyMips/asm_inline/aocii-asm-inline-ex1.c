//gcc -O3 -S -masm=intel -mtune=native aocii-asm-inline-ex1.c && code aocii-asm-inline-ex1.s

#include <stdio.h>

int sum(int x, int y);

int main()
{
    printf("%d\n", sum(14, 5));
    return 0;
}

// ebp: base da pilha
// esp: topo da pilha
// eax: acumulador

// l -> q
// e -> r
// INICIO DO CÓDIGO EM .asm
__asm__(
    "sum:;" // FUNÇÃO sum
    "   pushq %rbp;" // empurra o valor para o registrador rbp que é a base da pilha
    "   movq %rsp, %rbp;" // move o valor de rbp para rsp;  base para o topo da pilha
    "   movq 8(%rbp), %rax;" // offset = 8; move o valor de rax para esse offset da base da pulha
    "   addq 12(%rbp), %rax;" // offset = 12; move o valor de rax para esse offset
    "   movq %rbp, %rsp\n" // move o valor do topo da pilha para a base
    "   popq %rbp\n" // incrementa o valor na base da pilha
    "   ret" // retorna...
);

// __asm__(
//     "sum:\n"
//     "   movl %edi, %eax;"
//     "   addl %esi, %eax;"
//     "   ret");

// gcc --h
// gcc -O3 -S -masm=? -mtune=native -fverbose-asm main.c

// gcc -O3 -masm=att -mtune=native -fverbose-asm main.c
// gcc -O3 -masm=intel -mtune=native -fverbose-asm main.c

// -O3:             Nivel maximo de otimizacao
// -S:              Gera codigo assembly
// -masm=?:         Sintaxe padrao de geracao do codigo
// -mtune=native:   Processador nativo
// -fverbose-asm:   Inserção de comentários
