#include<stdio.h>

extern int max(int a,int b, int c) ;
extern int sum(int a, int b, int c);

int main(){
    int a = 3;
    int b = 3;
    int c = 1;
    printf("The greatest is: %d \n", max(a,b,c));
    printf("The sum is: %d \n", sum(a,b,c));
}