#include <stdio.h>

int main()
{
  int x,y;
  int r1,r2,r3,r4,r5;

  x = 4;
  y = 7;
  printf("x = %d\ny = %d\n", x, y);

  r1 = x+y;
  r2 = x-y;
  r3 = x/y;
  r4 = x*y;
  printf("x+y = %d\nx-y = %d\nr3 = x/y = %d\nr4 = x*y = %d\n", r1, r2, r3, r4);

  printf("x/3.0 = %f\n", x/3.0);

  r3++;
  r4--;
  r5 = r4%r1;
  printf("r3++ = %d\nr4-- = %d\nr4%%r1 = %d\n", r3, r4, r5);
}

