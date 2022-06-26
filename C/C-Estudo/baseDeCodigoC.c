#include<stdio.h>
#include<stdlib.h>

#define TAM_STRING 20

main()
{
    int num1;
    float num2;
    char string[TAM_STRING];

    printf("\n\n\n");
    scanf("%d",&num1);
    scanf("%f",&num2);
    getchar();
    fgets(string, TAM_STRING, stdin);

    printf("%d",num1);
    printf("\n%f",num2);
    printf("\n%s",string);
}