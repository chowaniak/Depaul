#include <stdio.h>
 
main()			/* counts digits, white space, others */
{
  int c, i, num_digits[10], num_white, num_other;

  num_white = num_other = 0;

  for(i = 0; i < 10; i++)		/* initialize */
    num_digits[i] = 0;

  while((c = getchar()) != EOF) {
    if (c >= '0' && c <= '9')
      ++num_digits[c-'0'];
    else if (c == ' ' || c == '\n' || c == '\t')
      ++num_white;
    else
      ++num_other;
  }

  printf("digits =");
  for(i = 0; i < 10; i++)
    printf(" %d", num_digits[i]);
  printf(", white space = %d, other = %d\n", num_white, num_other);
}
