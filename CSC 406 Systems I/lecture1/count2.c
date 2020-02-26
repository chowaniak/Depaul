#include <stdio.h>
 
main()			/* counts digits, white space, others */
{
  int c, i, num_digits[10], num_white, num_other;

  num_white = num_other = 0;

  for(i = 0; i < 10; i++)		/* initialize */
    num_digits[i] = 0;

  while((c = getchar()) != EOF) {
    switch(c) {
    case '0':
    case '1':
    case '2':
    case '3':
    case '4':
    case '5':
    case '6':
    case '7':
    case '8':
    case '9': num_digits[c - '0']++; break;
    case ' ':
    case '\t':
    case '\n': num_white++; break;
    default:  num_other++; break;
    }
  }
  printf("digits =");
  for(i = 0; i < 10; i++)
    printf(" %d", num_digits[i]);
  printf(", white space = %d, other = %d\n", num_white, num_other);
}
