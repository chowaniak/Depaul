#include <stdio.h>

void sort(int a [], int n)         /* insertion sort */
{
  int i,j,tmp;

  for (i = 1; i < n; i++) {
    tmp = a[i];
    j = i-1;
    while ((j >= 0) && tmp < a[j]) {
      a[j+1] = a[j];
      j--;
    }
    a[j+1] = tmp;
  }
}

int main()			/* test program */
{
  int ar[10] = {3, 4, 7, 0, 9, 8, 1, 6, 5, 2};
  int n = 10;
  int i;

  printf("The original array is: ");
  for(i = 0; i < n; i++)
    printf("%d ", ar[i]);
  printf("\n");

  sort(ar, n);

  printf("The sorted array is: ");
  for(i = 0; i < n; i++)
    printf("%d ", ar[i]);
  printf("\n");
}
