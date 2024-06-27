void black(){
glColor3f(0,0,0);
}

void white(){
glColor3f(1,1,1);
}

void red(){
glColor3f(1,0,0);
}

void green(){
glColor3f(0,1,0);
}

void blue(){
glColor3f(0,0,1);
}

void yellow(){
glColor3f(1,1,0);
}

void ciano(){
glColor3f(0,1,1);
}
void yellow_terminal(void) {
    printf("\033[1;33m");
}

void green_terminal(void) {
    printf("\033[1;32m");
}

void red_terminal(void) {
    printf("\033[1;31m");
}
void white_terminal(void) {
    printf("\033[1;29m");
}
void reset_cores(void) {
    printf("\033[0m");
}
