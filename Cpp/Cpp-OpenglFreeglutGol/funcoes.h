float r,g,b,x,y;
int contador = 0;
float xBola = 0, yBola = 0;

int yfig = yBola;
float theta;
int posX = xBola;
int posY = yfig;
GLfloat radio = 0.8;


// LINHA GUIA
void linha_guia()
{
    red();
    glBegin (GL_LINES);
    // EIXOS x E y
    glVertex2f(-10,0); // ax
    glVertex2f(10,0); // bx
    glVertex2f(0,-10); // ay
    glVertex2f(0,10); //by */

    glEnd();
}

// FIGURA GOL
void figura_gol()
{
    // traves
    glLineWidth(5);
    white();

    glBegin(GL_LINE_STRIP);
    glVertex2d(-3,0);
    glVertex2d(-3,3);
    glVertex2d(3,3);
    glVertex2d(3,0);
    glEnd();
    // rede
    glLineWidth(2);
    glBegin(GL_LINE_STRIP);
    glVertex2d(-3,3);
    glVertex2d(-2.7,2.7);
    glVertex2d(-2.5,0);
    glVertex2d(2.5,0);
    glVertex2d(2.7,2.7);
    glVertex2d(3,3);
    glEnd();

    glLineWidth(2);
    glBegin(GL_LINE_STRIP);
    glVertex2d(-3,0);
    glVertex2d(-2.5,0);
    glVertex2d(2.5,0);
    glVertex2d(3,0);
    glEnd();
}

// FIGURA CAMPO
void figura_campo()
{
    // campo
    green();
    glBegin(GL_POLYGON);
    glVertex2d(-6,0);
    glVertex2d(6,0);
    glVertex2d(9,-10);
    glVertex2d(-9,-10);
    glEnd();
    // linhas
    white();
    glBegin(GL_LINE_STRIP);
    glVertex2d(-4,0);
    glVertex2d(-5,-4);
    glVertex2d(5,-4);
    glVertex2d(4,0);

    glVertex2d(-6,0);
    glVertex2d(6,0);
    glVertex2d(9,-10);
    glVertex2d(-9,-10);
    glVertex2d(-6,0);
    glEnd();
    // penalti
    white();
    glPointSize(10);
    glBegin(GL_POINTS);
    glVertex2d(0,-2.5);
    glEnd();
    // bandeirinhas
    black();
    glLineWidth(3);
    glBegin(GL_LINES);
    glVertex2d(-6,0);
    glVertex2d(-6,2);
    glVertex2d(6,0);
    glVertex2d(6,2);
    glEnd();

    yellow();
    glBegin(GL_QUADS);
    glVertex2d(-6,2);
    glVertex2d(-5.5,2);
    glVertex2d(-5.5,1.5);
    glVertex2d(-6,1.5);

    glVertex2d(6,2);
    glVertex2d(5.5,2);
    glVertex2d(5.5,1.5);
    glVertex2d(6,1.5);
    glEnd();
}

// FIGURA BOLA
void figura_bola()
{
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

void MouseAndandoNaoPressionado (int x, int y)
{
    printf("mouseX = %d\tmouseY = %d\n", x,y);
}
