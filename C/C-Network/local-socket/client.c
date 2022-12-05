#include <stdio.h>

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <unistd.h>
#define PORT 8080
#define CLOSE_CLIENT "close_client()"

// VERIFICA O SISTEMA OPERACIONAL PARA SUBSTITUIR FUNÇÕES DE LIMPEZA DE TELA, BUFFER E SLEEP
#if defined(__MINGW32__) || defined(_MSC_VER)
#define clean_input() fflush(stdin)
#define clear_screen() system("cls")
#define sleep() system("timeout 1")
#else
#include <stdio_ext.h>
#define clean_input() __fpurge(stdin)
#define clear_screen() system("clear")
#define sleep() system("sleep 1")
#endif

// funções de controle de cor para visualização do usuário
char print_pink(char *s);
char print_yellow(char *s);
char print_blue(char *s);
char print_green(char *s);
char print_green(char *s);
char print_red(char *s);
char print_white(char *s);
char print_cyan(char *s);

int main(int argc, char const *argv[])
{
    char option, option_valida;

    system("clear");
    print_blue("\nTrabalho 06 - API socket BSD");
    print_blue("\nWHATSAPP DE POBRE\n");

    do
    {
        print_green("1. Enviar mensagem\n");
        print_pink("2. Sair");
        printf("\n.: ");
        scanf("%c", &option); // recebe a opção
        getchar();            // recebe o enter

        // valida a opção
        option_valida = (option == '1' || option == '2');
        if (!option_valida)
        {
            clear_screen();
            fflush(stdin);
            print_red("\nOps... Opção ivalida\n\n");
        }
    } while (!option_valida);

    switch (option)
    {
    case '1':
        int sock = 0, server_message, client_fd;
        struct sockaddr_in server_addr;
        char *buffer[1024], *mensagem[1024];

        if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0)
        {
            print_red("\n[client] Erro de criacao do socket\n");
            return -1;
        }

        server_addr.sin_family = AF_INET;
        server_addr.sin_port = htons(PORT);

        if (inet_pton(AF_INET, "127.0.0.1", &server_addr.sin_addr) <= 0)
        {
            print_red(
                "\n[client] Erro de validacao do endereco IPv4\n");
            return -1;
        }

        if ((client_fd = connect(sock, (struct sockaddr *)&server_addr,
                                 sizeof(server_addr))) < 0)
        {
            print_red("\n[client] Erro de conexao... Verifique se o servidor esta rodando");
            return -1;
        }

        do
        {
            fflush(stdin);
            printf("\n[client] ");
            fgets(mensagem, 1024, stdin);
            // scanf("%s", &mensagem);
            // getchar();
            send(sock, mensagem, strlen(mensagem), 0);
            print_green("[client] ✓ enviado");

            server_message = read(sock, buffer, 1024);
            printf("%s", buffer);
            memset(buffer, 0, sizeof buffer);

        } while (strcmp(mensagem, CLOSE_CLIENT) != 0);

        close(client_fd);
        return 0;
        break;
    case '2':
        print_pink("\nAu revoir...");
        exit(0);
        break;
    }
}

// Funções de controle de cor para visualização do usuário
// Recebem uma string e formatam sua cor para saída no terminal bash
char print_pink(char *s)
{
    printf("\033[1;35m%s\033[0m", s);
}

char print_cyan(char *s)
{
    printf("\033[1;36m%s\033[0m", s);
}

char print_yellow(char *s)
{
    printf("\033[1;33m%s\033[0m", s);
}

char print_blue(char *s)
{
    printf("\033[1;34m%s\033[0m", s);
}

char print_green(char *s)
{
    printf("\033[1;32m%s\033[0m", s);
}

char print_red(char *s)
{
    printf("\033[1;31m%s\033[0m", s);
}

char print_white(char *s)
{
    printf("\033[1;29m%s\033[0m", s);
}

char print_reset(char *s)
{
    printf("\033[0m%s\033[0m", s);
}
