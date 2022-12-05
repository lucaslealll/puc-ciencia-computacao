// Client side C/C++ program to demonstrate Socket
// programming
#include <arpa/inet.h>
#include <stdio.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>
#define PORT 8080

int main(int argc, char const *argv[])
{
    int sock = 0, server_message, client_fd;
    struct sockaddr_in server_addr;
    char buffer[1024] = {0}, mensagem[1024];
    if ((sock = socket(AF_INET, SOCK_STREAM, 0)) < 0)
    {
        printf("\nErro de criacao do socket\n");
        return -1;
    }

    server_addr.sin_family = AF_INET;
    server_addr.sin_port = htons(PORT);

    // Convert IPv4 and IPv6 addresses from text to binary
    // form
    if (inet_pton(AF_INET, "127.0.0.1", &server_addr.sin_addr) <= 0)
    {
        printf(
            "\nErro de validacao do endereco IPv4\n");
        return -1;
    }

    if ((client_fd = connect(sock, (struct sockaddr *)&server_addr,
                             sizeof(server_addr))) < 0)
    {
        printf("\nErro de conexao\nVerifique se o servidor esta rodando");
        return -1;
    }

    do
    {
        // printf("Digite uma mensagem: ");
        fgets(mensagem, 1024, stdin);
        printf("✓");
        send(sock, mensagem, strlen(mensagem), 0);

        server_message = read(sock, buffer, 1024);
        printf("%s\n", buffer);

    } while (mensagem != "close_client()");

    // closing the connected socket
    close(client_fd);
    return 0;
}
