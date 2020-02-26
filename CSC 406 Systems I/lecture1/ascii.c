#include <stdio.h>

int main()
{
  int i;

  for (i = 0; i < 128; i++)
    printf("%c:  %d\n", i, i);
}
