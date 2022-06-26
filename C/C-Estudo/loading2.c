#include<stdio.h>

void loading()
{   
        printf("Loading");
        fflush(stdout);
        system("sleep 1");
        system("clear");

        printf("Loading.");
        fflush(stdout);
        system("sleep 1");
        system("clear");

        printf("Loading..");
        fflush(stdout);
        system("sleep 1");
        system("clear");

        printf("Loading...");
        fflush(stdout);
        system("sleep 1");
        system("clear");

        loading();
}

int main()
{
        system("clear");
        loading();
}
 
