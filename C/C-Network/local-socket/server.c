// Server side C/C++ program to demonstrate Socket
// programming
// VERIFICA O SISTEMA OPERACIONAL PARA SUBSTITUIR FUNÇÕES DE LIMPEZA DE TELA, BUFFER E SLEEP

#include <netinet/in.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <sys/socket.h>
#include <unistd.h>
#define PORT 8080
#define CLOSE_SERVER "close_server()"

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

int main(int argc, char const *argv[])
{

    system("clear");
    printf("\nTrabalho 06 - API socket BSD");
    printf("\nSERVIDOR\n");

    int server_fd, client, client_message;
    struct sockaddr_in address;
    int opt = 1;
    int addrlen = sizeof(address);
    char *check = "\n[server] ✓✓ recebido\n";
    char buffer[1024] = {0};

    // Creating socket file descriptor
    if ((server_fd = socket(AF_INET, SOCK_STREAM, 0)) < 0)
    {
        perror("[server] socket failed");
        exit(EXIT_FAILURE);
    }

    // Forcefully attaching socket to the port 8080
    if (setsockopt(server_fd, SOL_SOCKET,
                   SO_REUSEADDR | SO_REUSEPORT, &opt,
                   sizeof(opt)))
    {
        perror("[server] setsockopt");
        exit(EXIT_FAILURE);
    }
    address.sin_family = AF_INET;
    address.sin_addr.s_addr = INADDR_ANY;
    address.sin_port = htons(PORT);

    // Forcefully attaching socket to the port 8080
    if (bind(server_fd, (struct sockaddr *)&address,
             sizeof(address)) < 0)
    {
        perror("[server] bind failed");
        exit(EXIT_FAILURE);
    }
    if (listen(server_fd, 3) < 0)
    {
        perror("[server] listen");
        exit(EXIT_FAILURE);
    }
    if ((client = accept(server_fd, (struct sockaddr *)&address,
                         (socklen_t *)&addrlen)) < 0)
    {
        perror("[server] accept");
        exit(EXIT_FAILURE);
    }

    memset(buffer, 0, sizeof buffer);

    do
    {
        memset(buffer, 0, sizeof buffer);
        client_message = read(client, buffer, 1024);
        printf("\n[client] %s", buffer);
        send(client, check, strlen(check), 0);

    } while (strcmp(buffer, CLOSE_SERVER) != 0);
    // closing the connected socket
    close(client);
    // closing the listening socket
    shutdown(server_fd, SHUT_RDWR);
    return 0;
}
