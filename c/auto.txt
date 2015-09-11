#include <stdio.h>

void foo(void)
{
    int a = 41;
    a = a++;
    printf("%d\n", a);
}

void bar(void) 
{
    int m = 22;
    int a = 42;
}

struct X
{
    int a; 
    char b;
    int c;
    char* p;
};

int main() {
    int a;
    printf("%d\n", a);
    printf("%d\n", sizeof(int));
    printf("%d\n", sizeof(char));
    printf("%d\n", sizeof(struct X));
}

