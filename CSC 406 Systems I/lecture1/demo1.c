/* demo1.c - demo program */

#include <stdlib.h> // scanf
#include <stdio.h>  // printf

int main()
{
  int x;
  int y=34;
    
  printf("Please enter an integer: ");
  scanf("%d", &x );  /* &x is the memory address of variable x*/
  printf("x: %d  y: %d\n", x, y );
    
  return 0;

}
