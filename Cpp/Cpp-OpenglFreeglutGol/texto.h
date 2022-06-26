void chamaTexto(void *font, char *string)
{
// Exibe caractere a caractere
    while(*string)
        glutBitmapCharacter(GLUT_BITMAP_9_BY_15,*string++);
}

void golTexto()
{

    green_terminal();
    glRasterPos2f(40,40);
    chamaTexto(GLUT_BITMAP_9_BY_15,"GOL!!!");

}
void naTraveTexto()
{

    yellow_terminal();
    glRasterPos2f(40,40);
    chamaTexto(GLUT_BITMAP_9_BY_15,"NA TRAVE!!!");

}
void praForaTexto()
{

    red_terminal();
    glRasterPos2f(40,40);
    chamaTexto(GLUT_BITMAP_9_BY_15,"PRA FORA!!!");

}
