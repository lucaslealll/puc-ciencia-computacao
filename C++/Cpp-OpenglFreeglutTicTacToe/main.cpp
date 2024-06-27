#include<GL/freeglut.h>
#include<iostream>
#include<stdio.h>
#include<string>
#include<math.h>

#include "cores.h" // HEADER DE CORES

// GLOBAIS
float r,g,b,x,y;
bool check = false;
int contador = 0, jogadas[9] = {9, 9, 9, 9, 9, 9, 9, 9, 9};
int casaClick = 0, i, ganhador = 100, restart = 0;
int ganhou = 0; int conta = 0;

void fimDeJogo(void);

// CHAMA TEXTO
void chamaTexto(void *font, char *string)
{
// Exibe caractere a caractere
    while(*string)
        glutBitmapCharacter(GLUT_BITMAP_9_BY_15,*string++);
}

// CONFERE WIN
void ganhouH1(void)
{
    printf("\n\n GANHOU LINHA 1 \n\n");
    fimDeJogo();
}
void ganhouH2(void)
{
    printf("\n\n GANHOU LINHA 2 \n\n");
    fimDeJogo();
}
void ganhouH3(void)
{
    printf("\n\n GANHOU LINHA 3 \n\n");
    fimDeJogo();
}
void ganhouL1(void)
{
    printf("\n\n GANHOU COLUNA 1 \n\n");
    fimDeJogo();
}
void ganhouL2(void)
{
    printf("\n\n GANHOU COLUNA 2 \n\n");
    fimDeJogo();
}
void ganhouL3(void)
{
    printf("\n\n GANHOU COLUNA 3 \n\n");
    fimDeJogo();
}
void ganhouD1(void)
{
    printf("\n\n GANHOU DIAGONAL 1 \n\n");
    fimDeJogo();
}
void ganhouD2(void)
{
    printf("\n\n GANHOU DIAGONAL 2 \n\n");
    fimDeJogo();
}


void confereWin()
{
    if(jogadas[0] == 1 && jogadas[1] == 1 && jogadas[2] == 1)
    {
        ganhador = 1;
        restart = 1;
        ganhou = 1;
        ganhouH1();
    }
    else if(jogadas[0] == 0 && jogadas[1] == 0 && jogadas[2] == 0)
    {
        ganhador = 2;
        restart = 1;
        ganhou = 1;

        ganhouH1();
    }
    else if(jogadas[3] == 1 && jogadas[4] == 1 && jogadas[5] == 1)
    {
        ganhador = 1;
        restart = 1;
        ganhou = 1;

        ganhouH2();
    }
    else if(jogadas[3] == 0 && jogadas[4] == 0 && jogadas[5] == 0)
    {
        ganhador = 2;
        restart = 1;
        ganhou = 1;

        ganhouH2();
    }
    else if(jogadas[6] == 1 && jogadas[7] == 1 && jogadas[8] == 1)
    {
        ganhador = 1;
        restart = 1;
        ganhou = 1;

        ganhouH3();
    }
    else if(jogadas[6] == 0 && jogadas[7] == 0 && jogadas[8] == 0)
    {
        ganhador = 2;
        restart = 1;
        ganhou = 1;

        ganhouH3();
    }
    else if(jogadas[0] == 1 && jogadas[3] == 1 && jogadas[6] == 1)
    {
        ganhador = 1;
        restart = 1;
        ganhou = 1;

        ganhouL1();
    }
    else if(jogadas[0] == 0 && jogadas[3] == 0 && jogadas[6] == 0)
    {
        ganhador = 2;
        restart = 1;
        ganhou = 1;

        ganhouL1();
    }
    else if(jogadas[1] == 1 && jogadas[4] == 1 && jogadas[7] == 1)
    {
        ganhador = 1;
        restart = 1;
        ganhou = 1;

        ganhouL2();
    }
    else if(jogadas[1] == 0 && jogadas[4] == 0 && jogadas[7] == 0)
    {
        ganhador = 2;
        restart = 1;
        ganhou = 1;

        ganhouL2();
    }
    else if(jogadas[2] == 1 && jogadas[5] == 1 && jogadas[8] == 1)
    {
        ganhador = 1;
        restart = 1;
        ganhou = 1;

        ganhouL3();
    }
    else if(jogadas[2] == 0 && jogadas[5] == 0 && jogadas[8] == 0)
    {
        ganhador = 2;
        restart = 1;
        ganhou = 1;

        ganhouL3();
    }
    else if(jogadas[0] == 1 && jogadas[4] == 1 && jogadas[8] == 1)
    {
        ganhador = 1;
        restart = 1;
        ganhou = 1;

        ganhouD1();
    }
    else if(jogadas[0] == 0 && jogadas[4] == 0 && jogadas[8] == 0)
    {
        ganhador = 2;
        restart = 1;
        ganhou = 1;

        ganhouD1();
    }
    else if(jogadas[2] == 1 && jogadas[4] == 1 && jogadas[6] == 1)
    {
        ganhador = 1;
        restart = 1;
        ganhou = 1;

        ganhouD2();
    }
    else if(jogadas[2] == 0 && jogadas[4] == 0 && jogadas[6] == 0)
    {
        ganhador = 2;
        restart = 1;
        ganhou = 1;

        ganhouD2();
    }
    printf("\n\n\t ---->>>> %d \n\n",conta);
    if (conta == 9)
    {
        ganhador = 50;
        fimDeJogo();
    }
}

// FIM DE JOGO
void fimDeJogo()
{
    glClearColor(0, 0, 0, 0);
    glClear(GL_COLOR_BUFFER_BIT);
    red();
    glRasterPos2f(97.5,200);
    chamaTexto(GLUT_BITMAP_9_BY_15,"FIM DE JOGO");

    white();
    glRasterPos2f(30,170);
    chamaTexto(GLUT_BITMAP_9_BY_15,"Right click -> Play again");
    glRasterPos2f(30,150);
    chamaTexto(GLUT_BITMAP_9_BY_15,"  X   click -> Quit game");

    printf("\n\n ------->>>> %d \n\n", ganhador);


    if (ganhador == 1)
    {
        yellow();
        glRasterPos2f(97,100);
        chamaTexto(GLUT_BITMAP_9_BY_15,"J2 Venceu!!!");
    }
    else if (ganhador == 2)
    {
        yellow();
        glRasterPos2f(97,100);
        chamaTexto(GLUT_BITMAP_9_BY_15,"J1 Venceu!!!");
    }
    else if (ganhador == 50)
    {
        yellow();
        glRasterPos2f(125,100);
        chamaTexto(GLUT_BITMAP_9_BY_15,"Empate");
    }
}

// LINHA GUIA
void linhaGuia()
{
    glBegin (GL_LINES);
    red();
    glVertex2f(150.0,0);  // ax
    glVertex2f(150.0,350.0); // bx
    glVertex2f(0,175.0);   // by
    glVertex2f(300,175.0);  // ay
    glEnd();
}
// MARGENS
void margens()
{
    glBegin(GL_LINE_LOOP);
    glVertex2f(25.0,25.0);
    glVertex2f(275.0,25.0);
    glVertex2f(275,325.0);
    glVertex2f(25.0,325.0);
    glEnd();
}

// JOGO DA VELHA LINHAS
void jogodaVelha()
{
    black();
    glLineWidth(30);
    glBegin (GL_LINES);
// LINHA VERTICAL
    glVertex2f(108.3,50);
    white();
    glVertex2f(108.3,300.0);
    glVertex2f(191.6,50);
    black();
    glVertex2f(191.6,300.0);
// LINHA HORIZONTAL
    glVertex2f(25,216.6);
    white();
    glVertex2f(275,216.6);
    glVertex2f(25,133.3);
    black();
    glVertex2f(275,133.3);

    glEnd();
}

// NOME DO JOGO
void gameName()
{
    white();
    glRasterPos2f(25, 33*10);
//chamaTexto(GLUT_BITMAP_9_BY_15,"Old Lady's Game");
    chamaTexto(GLUT_BITMAP_9_BY_15,"Jogo da Velha");
}

// PLACAR
void placar()
{
    if ((contador % 2) == 0 )
    {
        black();
        glRasterPos2f(191.5, 33*10);
        chamaTexto(GLUT_BITMAP_9_BY_15,"Jogador II");

        blue();
        glRasterPos2f(191.5, 33*10);
        chamaTexto(GLUT_BITMAP_9_BY_15,"Jogador I");
    }
    else
    {
        red();
        glRasterPos2f(191.5, 33*10);
        chamaTexto(GLUT_BITMAP_9_BY_15,"Jogador II");
    }
}

// DESENVOLVEDOR TEXTO
void devTexto()
{
    white();
    glRasterPos2f(87,15);
    chamaTexto(GLUT_BITMAP_9_BY_15,"-by LucasOmar-");
}

// PRINTA FIGURA
void printaFigura()
{
    int yfig = 350 - y;
    contador = contador % 2;

    if (check)
    {
        glPointSize(55);
        glLineWidth(55);
        if (contador == 0) // XIS
        {
            blue();
            glBegin(GL_LINES);
            glVertex2i(x-27.5,yfig-27.5);
            red();
            glVertex2i(x+27.5,yfig+27.5);
            blue();
            glVertex2i(x+27.5,yfig-27.5);
            red();
            glVertex2i(x-27.5,yfig+27.5);
            glEnd();
        }
        else // BOLINHA
        {
            blue();
            float theta;
            int posX = x;
            int posY = yfig;
            int radio = 33;
            glBegin(GL_POLYGON);
            for(int i=0; i<360; i++)
            {
                int j = -i;
                glColor3b(j,0,i);
                theta = i*3.14/180;
                glVertex2f(posX + radio*cos(theta), posY + radio*sin(theta));
            }
            glEnd();
        }
        glEnd();
    }
}

// FUNC VETOR
void vetor(void)
{
    printf("\n");
    for(i = 0; i < 9; i++)
    {
        if(i == 3)
        {
            printf("\n");
        }
        if(i == 6)
        {
            printf("\n");
        }
        printf(" %d ", jogadas[i]);
    }
}

// ORGANIZA FIGURAS
void organizaPrint()
{
    if ( !ganhou )
    {
// LINHA 1
        if ((x >= 0  && x <= 111) && (y >= 0 && y <= 135))
        {
            printf("[1,1]\n");
            x = 65, y=90;
            casaClick = 0;

            if (jogadas[casaClick] == 9)
            {
                jogadas[casaClick] = contador;
                contador++; conta++;
                printaFigura();
            }
        }
        else if ((x >= 111 && x <= 192) && (y >= 0 && y <= 135))
        {
            printf("[1,2]\n");
            x = 150, y=90;
            casaClick = 1;

            if (jogadas[casaClick] == 9)
            {
                jogadas[casaClick] = contador;
                contador++; conta++;
                printaFigura();
            }
        }
        else if ((x >= 192 && x <= 300) && (y >= 0 && y <= 135))
        {
            printf("[1,3]\n");
            x = 235, y=90;
            casaClick = 2;

            if (jogadas[casaClick] == 9)
            {
                jogadas[casaClick] = contador;
                contador++; conta++;
                printaFigura();
            }
        }
// LINHA 2
        else if ((x >= 0  && x <= 111) && (y >= 135 && y <= 215))
        {
            printf("[2,1]\n");
            x = 65, y=175;
            casaClick = 3;

            if (jogadas[casaClick] == 9)
            {
                jogadas[casaClick] = contador;
                contador++; conta++;
                printaFigura();
            }
        }
        else if ((x >= 111 && x <= 192) && (y >= 135 && y <= 215))
        {
            printf("[2,2]\n");
            x = 150, y=175;
            casaClick = 4;

            if (jogadas[casaClick] == 9)
            {
                jogadas[casaClick] = contador;
                contador++; conta++;
                printaFigura();
            }
        }
        else if ((x >= 192 && x <= 300) && (y >= 135 && y <= 215))
        {
            printf("[2,3]\n");
            x = 235, y=175;
            casaClick = 5;

            if (jogadas[casaClick] == 9)
            {
                jogadas[casaClick] = contador;
                contador++; conta++;
                printaFigura();
            }
        }
// LINHA 3
        else if ((x >= 0  && x <= 111) && (y >= 215 && y <= 350))
        {
            printf("[3,1]\n");
            x = 65, y=257.5;
            casaClick = 6;

            if (jogadas[casaClick] == 9)
            {
                jogadas[casaClick] = contador;
                contador++; conta++;
                printaFigura();
            }
        }
        else if ((x >= 111 && x <= 192) && (y >= 215 && y <= 350))
        {
            printf("[3,2]\n");
            x = 150, y=257.5;
            casaClick = 7;

            if (jogadas[casaClick] == 9)
            {
                jogadas[casaClick] = contador;
                contador++; conta++;
                printaFigura();
            }
        }
        else if ((x >= 192 && x <= 300) && (y >= 215 && y <= 350))
        {
            printf("[3,3]\n");
            x = 235, y=257.5;
            casaClick = 8;

            if (jogadas[casaClick] == 9)
            {
                jogadas[casaClick] = contador;
                contador++; conta++;
                printaFigura();
            }
        }
        else
        {
            printf("\n\n LUGAR ERRADO MERMAO\n\n");
        }

        vetor();

        confereWin();

        if (contador == 9 && ganhador == 100)
        {
            ganhador = 50; // EMPATE
        }
    }
}

// MOUSE SOLTO
void MouseAndandoNaoPressionado (int x, int y)
{
    printf("Xs = %d Ys = %d\n", x,y);
}

// MOUSE PRESSIONADO
void MouseAndandoPressionado (int x, int y)
{
    printf("Xp = %d Yp = %d\n", x,y);
}

// PRINT DO MOUSE
void mousePrint (int button, int state, int mousex, int mousey)
{
    if (contador <= 8)
    {
        if(button == GLUT_LEFT_BUTTON && state == GLUT_DOWN)
        {
            check = true;
            x = mousex;
            y = mousey;

            organizaPrint();
        }
    }
    if (button == GLUT_RIGHT_BUTTON && state == GLUT_DOWN) // LIMPA A TELA
    {
        glClearColor(0, 0, 0, 0);
        glClear(GL_COLOR_BUFFER_BIT);
        check = false;

        for(i=0; i<9; i++)
        {
            jogadas[i]=9;    // RESETA VETOR
        }

        contador = 0; conta = 0;
        casaClick = 0;
        ganhador = 100;
        ganhou = 0;
    }
    glutPostRedisplay();
}

// DESENHA
// MANIPULA A JANELA
void display(void)
{
// LIMPA O BUFFER
//    glClear( GL_COLOR_BUFFER_BIT );

// REDIMENSIONAMENTO
    glMatrixMode(GL_PROJECTION);
    glLoadIdentity();

// DEFINE O POSICIONAMENTO DA CAMERA
    gluOrtho2D(0.0, 300.0, 0.0, 350.0);

// REDIMENSIONAMENTO
    glMatrixMode(GL_MODELVIEW);
    glLoadIdentity();

// LINHA GUIA E MARGEM
    glLineWidth(1);
    red();
    //linhaGuia();
    // margens();

// PRINTA FIGURA
    //printaFigura();

// JOGO DA VELHA LINHA #
    if (ganhou == 0 && ganhador != 50)
    {
        jogodaVelha();
    }

// JOGO DA VELHA
    placar();
    gameName();

// PRINTA DESENVOLVEDOR
    devTexto();

    glFlush();
}

// LEITURA DO TECLADO
// LE TECLADO
char loop;
void teclado (unsigned char tecla, GLint x, GLint y)
{
    fflush(stdin);
    tecla = tolower(tecla);
    loop = tecla;

    switch(tecla)
    {
    case 'y':
        printf("y ");
        break; // Continua jogo
    case 'n':
        printf("n ");
        break; // Sai do jogo
    case 'r':
        printf("r ");
        glClearColor(0,0,0,0);
        glClear( GL_COLOR_BUFFER_BIT );
        break;
    case 'x':
        printf("\n\n *** x (exit) ***\n");
        exit(0); // Força saída
    }
    display(); // AGE NA FUNÇÃO DESENHA
}

// FUNÇÃO PRINCIPAL
int main(int argc, char* argv[])
{
    srand(time(NULL));
    glutInit(&argc, argv);
    glutInitDisplayMode( GLUT_SINGLE | GLUT_RGB );
    glClear( GL_COLOR_BUFFER_BIT );
// GERA A JANELA
    glutInitWindowSize(300,350);
    glutInitWindowPosition(100,100);
// NOME DA JANELA
    glutCreateWindow("LUCAS OMAR - Trab. 3 - Jogo da velha OpenGL");
// LEITURA DO TECLADO
    glutKeyboardFunc(teclado);
// DEFINE COR DO (R,G,B,OPACIDADE) DO DESENHO
    glClearColor(0,0,0,0); //glClearColor(0,0.5,0.5,10);
    glClear(GL_COLOR_BUFFER_BIT);
// APLICA FUNÇÃO NA JANELA
    glutDisplayFunc(display);
// MOUSE PRINT
    glutMouseFunc(mousePrint);
// MOUSE SOLTO
    //glutPassiveMotionFunc(MouseAndandoNaoPressionado);
// MOUSE PRESSIONADO
    //glutMotionFunc(MouseAndandoPressionado);
// DEFINE O LOOP DO MAIN
    glutMainLoop();

    return 0;
}
