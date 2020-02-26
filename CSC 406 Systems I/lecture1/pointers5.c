#include <stdio.h>

void swap(int *px, int *py)
{
  int temp;

  printf("x = %d, y = %d before the swap.\n", *px, *py);

  temp = *px;
  *px = *py;
  *py = temp;

  printf("x = %d, y = %d after the swap.\n", *px, *py);
}

int main()
{
    int a = 0;
    int b = -123;

    printf("a = %d, b = %d before the swap.\n", a, b);
    swap(&a, &b);
    printf("a = %d, b = %d after the swap.\n", a, b);

    return 0;
}
