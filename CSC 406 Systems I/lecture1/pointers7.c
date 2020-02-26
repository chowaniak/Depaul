#include <stdio.h>

int main()
{
    int a[5] = {5, 10, 15, 20, 25};
    int *p = a;

    printf("a[0] = %d\n", a[0]);
    printf("a[1] = %d\n", a[1]);
    printf("a[2] = %d\n", a[2]);

    printf("*p     = %d\n", *p);
    printf("*(p+1) = %d\n", *(p+1));
    printf("*(p+2) = %d\n", *(p+2));

    printf("p[0] = %d\n", p[0]);
    printf("p[1] = %d\n", p[1]);
    printf("p[2] = %d\n", p[2]);

    printf("*a     = %d\n", *a);
    printf("*(a+1) = %d\n", *(a+1));
    printf("*(a+2) = %d\n", *(a+2));

    return 0;
}
