#include <stdio.h>
#include <stdlib.h>

struct registro
{
    float temperatura; // offset � sempre 0 (zero) Bytes

};

main()
{
    struct registro valor, *ptr;
    
    // PONTEIRO APONTA PARA O ENDEREÇO DE MEMÓRIA
    ptr = &valor;

    printf("Digite um valor para temperatura: ");
    scanf("%f", &valor.temperatura);

    printf("\nEndereco de 'valor'              = %x\n", &valor);
    printf("Endereco para onde '*ptr' aponta = %x\n", ptr);

    printf("Temperatura = %.1f°C\n\n", ptr->temperatura);
}
