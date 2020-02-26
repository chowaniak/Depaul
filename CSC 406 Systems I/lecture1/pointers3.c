#include <stdio.h>

void swap(int x, int y)
{
  int temp;

  printf("x = %d, y = %d before the swap.\n", x, y);

  temp = x;
  x = y;
  y = temp;

  printf("x = %d, y = %d after the swap.\n", x, y);
}

int main()
{
  int a = 0;
  int b = -123;

  printf("a = %d, b = %d before the swap.\n", a, b);
  swap(a, b);
  printf("a = %d, b = %d after the swap.\n", a, b);
  
  return 0;
}
