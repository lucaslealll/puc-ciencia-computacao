#ifndef FOOBAR_H // guardas de cabeçalho, impedem inclusões cíclicas
#define FOOBAR_H

#include <stdio.h>
#include <string.h>
#include <stdlib.h>
#include <unistd.h>
#include <arpa/inet.h>
#include <sys/socket.h>
#include <netinet/in.h>
#define PORT 8080

// VERIFICA O SISTEMA OPERACIONAL PARA SUBSTITUIR FUNÇÕES DE LIMPEZA DE TELA, BUFFER E SLEEP
#if defined(__MINGW32__) || defined(_MSC_VER)
#define clean_input() fflush(stdin)
#define clear_screen() system("cls")
#define sleep() system("timeout 5")
#else
#include <stdio_ext.h>
#define clean_input() __fpurge(stdin)
#define clear_screen() system("clear")
#define sleep() system("sleep 5")
#endif

#endif