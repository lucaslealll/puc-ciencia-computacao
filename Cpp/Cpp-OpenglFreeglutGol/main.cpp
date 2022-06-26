#include<GL/freeglut.h>
#include<iostream>
#include<stdio.h>
#include<math.h>

#include "cores.h"   // HEADER DE CORES
#include "funcoes.h" // HEADER DE FUNÇÕES
#include "texto.h"

GLfloat trans_x = 0, trans_y = -6, desloc = 1, chance = 1;




// DESENHA
// MANIPULA A JANELA
void desenha(void)
{
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
    //linha_guia();

    // PRINA CAMPO
    figura_campo();

    // PRINTA GOL
    figura_gol();

    // TRANSLAÇÃO DA IMAGEM
    glTranslated(trans_x,trans_y,0);

    // PRINTA BOLA
    figura_bola();

    glFlush();
}


// LEITURA DO TECLADO (AUMENTA E DIMINUI O TAMANHO)
// LE TECLADO
void le_teclado (unsigned char tecla, GLint x, GLint y)
{
    tecla = tolower(tecla);
    system("clear");

    fflush(stdin);
    switch(tecla)
    {
    case ' ':
        if (chance = 1)
        {
            while (yBola < 1)
            {
                trans_y = trans_y + 7.5;
                yBola = trans_y;
                radio = 0.2;
            }

            //printf("\n\nlanca ----->>> %.2f\n\n",trans_y);
            //printf("x = %.2f       y = %.2f", trans_x, trans_y);

            chance = 0;

            int gol = 0;

            if((trans_x > -3 && trans_x < 3) && (trans_x != -3 && trans_x != 3))
            {   green_terminal();
                printf("\n\t\t\t\t\tGOL!!!\n");reset_cores();
                white_terminal();
                printf("\n\t\t\t\t\tPRESSIONE 'R' PARA JOGAR NOVAMENTE!!!\n\n");
            }
            if((trans_x == -3) || (trans_x == 3))
            {   yellow_terminal();
                printf("\n\t\t\t\t\tNA TRAVE!!!\n");reset_cores();
                white_terminal();
                printf("\n\t\t\t\t\tPRESSIONE 'R' PARA JOGAR NOVAMENTE!!!\n\n");
            }
            if((trans_x < -3 || trans_x > 3) && (trans_x != -3 && trans_x != 3))
            {   red_terminal();
                printf("\n\t\t\t\t\tPRA FORA!!!\n");reset_cores();
                white_terminal();
                printf("\n\t\t\t\t\tPRESSIONE 'R' PARA JOGAR NOVAMENTE!!!\n\n");
            }
        }
        break;

    case 'r':
        radio = 0.8;
        trans_y= -6;
        yBola = -6;
        chance = 1;
        break;

    case 27:// 27 = esc
        printf("\n\n *** x (exit) ***\n"); // SAI DO PROGRAMA
        exit(0);
    }
    desenha(); // AGE NA FUNÇÃO DESENHA
}

// LE TECLADO ESPECIAL
void le_teclado_especial(int key, int x, int y)
{
    if (chance == 1)
    {
        switch(key)
        {
        case GLUT_KEY_UP:
            if ( trans_y < 0)
            {
                trans_y = trans_y + desloc ;
                printf("↑ \t x -> %d  y -> %d\n", trans_x,trans_y);
                radio = radio*0.9;
            }
            break;

        case GLUT_KEY_DOWN:
            if ( trans_y > -7)
            {
                trans_y = trans_y - desloc ;
                printf("↓ \t x -> %d  y -> %d\n", trans_x,trans_y);
                radio = radio*1.1;
            }
            break;

        case GLUT_KEY_LEFT:
            if ( trans_x > -6)
            {
                trans_x = trans_x - desloc ;
                printf("← \t x -> %d  y -> %d\n", trans_x,trans_y);
            }
            break;

        case GLUT_KEY_RIGHT:
            if ( trans_x < 6)
            {
                trans_x = trans_x + desloc ;
                printf("→ \t x -> %d  y -> %d\n", trans_x,trans_y);
            }
            break;
        }
    }
    desenha();
}

// FUNÇÃO PRINCIPAL
int main(int argc, char* argv[])
{
    glutInit(&argc, argv);
    glutInitDisplayMode( GLUT_SINGLE | GLUT_RGB );

    // GERA A JANELA
    glutInitWindowSize(640,480);
    glutInitWindowPosition(10,10);

    // NOME DA JANELA
    glutCreateWindow("LUCAS OMAR - Trab. 2 - Implementacao OpenGL");

    // movimento SEM botão pressionado
    glutPassiveMotionFunc(MouseAndandoNaoPressionado);

    // LEITURA DO TECLADO
    glutKeyboardFunc(le_teclado);
    glutSpecialFunc(le_teclado_especial);

    // DEFINE COR DO (R,G,B,OPACIDADE) DO DESENHO
    glClearColor(0,0.5,0.5,10);

    // APLICA FUNÇÃO NA JANELA
    glutDisplayFunc(desenha);

    // DEFINE O LOOP DO MAIN
    glutMainLoop();

    return 0;
}
