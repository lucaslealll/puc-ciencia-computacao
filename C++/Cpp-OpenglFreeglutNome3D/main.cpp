// Trab. 2 - Implementação sobre Transformações Afins em Open GL
//
// Ciência da Computação - PUC Minas - Poços de Caldas - MG
//
// Lucas 
//
// 16/set/2020
//
// Adaptação da aplicação de interação via teclado abordada na aula do dia 02/09 (desenho do triângulo verde/vermelho).
//
// Inserir as seguintes funcionalidades:
//
// F1 - Desenhar o seu nome na tela usando as primitivas gráficas.
//
// F2 - Limitar a aplicação da transformação afins de escalamento não permitindo o espelhamento vertical.
//
// F3 - Permitir a aplicação da transformação afins de rotação.
//
// F4 - Permitir a aplicação da transformação afins de translação.
//
// F5 - Será especificado na próxima aula.
//
// Entregar todo o código do projeto (executável e código-fonte), inserindo o arquivo executável na raiz.
//
// A aula do dia 09/09 será usada para esclarecermos dúvidas sobre o trabalho.

#include<GL/freeglut.h>
#include<iostream>
#include<stdio.h>

#include "cores.h"   // HEADER DE CORES
#include "funcoes.h" // HEADER DE FUNÇÕES

GLfloat escala = 1;
GLfloat trans_x = 0, trans_y = 0;
GLfloat angulo_x = 0, angulo_y = 0, angulo_z = 0;

// DESENHA
// MANIPULA A JANELA
    void desenha(void) {
    // LIMPA O BUFFER
        glClear( GL_COLOR_BUFFER_BIT );

    // REDIMENSIONAMENTO
        glMatrixMode(GL_PROJECTION);
        glLoadIdentity();

    // DEFINE O POSICIONAMENTO DA CAMERA
        gluOrtho2D(-8, 8, -8, 8);

    // REDIMENSIONAMENTO
        glMatrixMode(GL_MODELVIEW);
        glLoadIdentity();

    // LINHA GUIA
        glLineWidth(3);
        glColor4f(0,0,0,0);
        linha_guia();

        quadrado_fundo();

    // ESCAMENTO DA IMAGEM
        glScalef(escala, escala, 0);

    // TRANSLAÇÃO DA IMAGEM
        glTranslated(trans_x,trans_y,0);

    // ROTAÇÃO DA IMAGEM
        glRotatef(angulo_x,1,0,0); // EIXO X
        glRotatef(angulo_y,0,1,0); // EIXO Y
        glRotatef(angulo_z,0,0,1); // EIXO Z

    // PRINTA O NOME
        chama_nome();

    glFlush();
    }

// LEITURA DO TECLADO (AUMENTA E DIMINUI O TAMANHO)
// LE TECLADO
    void le_teclado (unsigned char tecla, GLint x, GLint y) {

    fflush(stdin);
        switch(tecla) {
            case '+': escala = escala * 1.1f; printf("+ "); break; // AUMENTA ESCALA
            case '-': escala = escala * 0.9f; printf("- "); break; // DIMINUI ESCALA

            case 'w': trans_y++; printf("w "); break; // SOBE
            case 's': trans_y--; printf("s "); break; // DESCE

            case 'a': trans_x--; printf("a "); break; // ESQUERDA
            case 'd': trans_x++; printf("d "); break; // DIREITA

            case 'q': angulo_x = angulo_x + 5; printf("q "); break;  // AUMENTA ANGULO EIXO X
            case 'e': angulo_x = angulo_x - 5; printf("e "); break;  // DIMINUI ANGULO EIXO X

            case 'z': angulo_y = angulo_y - 5; printf("z "); break;  // DIMINUI ANGULO EIXO Y
            case 'c': angulo_y = angulo_y + 5; printf("c "); break;  // AUMENTA ANGULO EIXO Y

            case 'g': angulo_z = angulo_z - 5; printf("g "); break;  // AUMENTA ANGULO EIXO Z
            case 'b': angulo_z = angulo_z + 5; printf("b "); break;  // DIMINUI ANGULO EIXO Z

            case 'x': printf("\n\n *** x (exit) ***\n"); exit(0); // SAI DO PROGRAMA
        }
        desenha(); // AGE NA FUNÇÃO DESENHA
    }

// FUNÇÃO PRINCIPAL
    int main(int argc, char* argv[]) {

      glutInit(&argc, argv);
      glutInitDisplayMode( GLUT_SINGLE | GLUT_RGB );

      // GERA A JANELA
      glutInitWindowSize(640,480);
      glutInitWindowPosition(10,10);

      // NOME DA JANELA
      glutCreateWindow("LUCAS OMAR - Trab. 2 - Implementacao OpenGL");

      // LEITURA DO TECLADO
      glutKeyboardFunc(le_teclado);

      // DEFINE COR DO (R,G,B,OPACIDADE) DO DESENHO
      glClearColor(0,0.5,0.5,10);

      // APLICA FUNÇÃO NA JANELA
      glutDisplayFunc(desenha);

      // DEFINE O LOOP DO MAIN
      glutMainLoop();

      return 0;
    }
