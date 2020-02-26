#include <stdio.h>

int main()
{
  int n, i, sum = 0;

  printf("\nThis program will compute the sum 1 + 2 + ... + n\n");
  printf("Enter a positive integer value for n: ");

  scanf("%d", &n);

  for(i = 1; i <= n; i++) {
      sum += i;
  }
  printf("\nThe sum of 1 + ... + %d is %d\n\n", n , sum);
}

