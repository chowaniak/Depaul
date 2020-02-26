#include<stdlib.h>  // to use malloc, free 
#include <stdio.h>

int main(){

  int i;
  int *array = (int *) malloc(4*sizeof(int));

  for (i = 0; i < 10; i++)
    array[i] = 5*i;

  for (i = 0; i < 10; i++)
    printf("array[%d] = %d\n", i, array[i]);

  free(array);

  return 0;
}
