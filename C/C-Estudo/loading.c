#include<stdio.h>

void loading()
{
    printf("Loading");
    fflush(stdout);                 // atualizar a tela

    for(int i = 1; i != -1; i++)    // repete infinitamente
    {   
        system("sleep 1");          // delay de 1 segundo
        printf(".");
        fflush(stdout);             // atualizar a tela

        if (i == 3)                 // se chegar a 3 pontos
        {
            system("sleep 1");      // delay de 1 segundo
            system("clear");        // limpa a tela
            loading();              // chama a função
        }
    }
}

int main()
{
    system("clear");
    loading();    
}
 
