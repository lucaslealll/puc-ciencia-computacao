// LINHA GUIA
    void linha_guia(){
        glBegin (GL_LINES);
        // EIXOS x E x
        /*        glVertex2f(-10,0); // ax
                glVertex2f(10,0); // bx
                glVertex2f(0,-10); // ay
                glVertex2f(0,10); //by */
        // DIAGONAIS
                glVertex2f(-10,10);
                glVertex2f(10,-10);
                glVertex2f(10,10);
                glVertex2f(-10,-10);
        glEnd();
    }

// QUADRADO FUNDO
    void quadrado_fundo(){
            glBegin (GL_QUADS);
                    glVertex2f(1.5,1.5);
                    glVertex2f(-1.5,1.5);
                    glVertex2f(-1.5,-1.5);
                    glVertex2f(1.5,-1.5);
            glEnd();

            black();
            glBegin(GL_POLYGON);
                    white();
                    glVertex2f(0.35,0);
                    black();
                    glVertex2f(0.25,0.25);
                    glVertex2f(0,0.35);
                    glVertex2f(-0.25,0.25);
                    glVertex2f(-0.35,0);
                    glVertex2f(-0.25,-0.25);
                    glVertex2f(0,-0.35);
                    glVertex2f(0.25,-0.25);
            glEnd();
        }

// CHAMA NOME
    void chama_nome(){
    //QUADRADO FUNDO
        glBegin(GL_POLYGON);
                ciano();
                glVertex2f(-5,1.5);
                glVertex2f(-6,0);
                glVertex2f(-5,-1.5);
                black();
                glVertex2f(5,-1.5);
                glVertex2f(6,0);
                glVertex2f(5,1.5);
        glEnd();

    //NOME
        // L
        glBegin(GL_LINE_STRIP);
        black();
                glVertex2f(-4.5,1);
                glVertex2f(-4.5,-0.5);
                //glVertex2f(-4,-1);
                glVertex2f(-3.5,-0.5);
        glEnd();

        // U
        glBegin(GL_LINE_STRIP);
        black();
                glVertex2f(-2.5,0.5);
                glVertex2f(-2.5,-0.5);
                //glVertex2f(-2,-1);
                glVertex2f(-1.5,-0.5);
                glVertex2f(-1.5,0.5);
        glEnd();

        // C
        glBegin(GL_LINE_STRIP);
        ciano();
                glVertex2f(0.5,0.5);
                //glVertex2f(-0,1);
                glVertex2f(-0.5,0.5);
                glVertex2f(-0.5,-0.5);
                //glVertex2f(-0,-1);
                glVertex2f(0.5,-0.5);
        glEnd();

        // A
        glBegin(GL_TRIANGLES);
            //glColor3f(0,0,0);
            black();
               glVertex2f(1.5,-0.5);
            //glColor3f(0,1,1);
            ciano();
                glVertex2f(2,0.5);
            //glColor3f(1,1,1);
            white();
                glVertex2f(2.5,-0.5);
        glEnd();

        // S
        glBegin(GL_LINE_STRIP);
        white();
                glVertex2f(4.5,0.5);
                //glVertex2f(4,1);
                glVertex2f(3.5,0.5);
                glVertex2f(3.5,0);
                //glVertex2f(4,-0.5);
                glVertex2f(4.5,0);
                glVertex2f(4.5,-0.5);
                //glVertex2f(4,-1);
                glVertex2f(3.5,-0.5);
        glEnd();
    }
