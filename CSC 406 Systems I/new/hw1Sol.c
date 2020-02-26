#include <stdio.h>
#include <limits.h>

void ranges() {
  printf("signed char\n");
  printf("minimum value: %d\n", SCHAR_MIN);
  printf("maximum value: %d\n\n", SCHAR_MAX);

  printf("unsigned char\n");
  printf("minimum value: 0\n");
  printf("maximum value: %u\n\n", UCHAR_MAX);

  printf("signed short \n");
  printf("minimum value: %d\n", SHRT_MIN);
  printf("maximum value: %d\n\n", SHRT_MAX);

  printf("unsigned short\n");
  printf("minimum value: 0\n");
  printf("maximum value: %u\n\n", USHRT_MAX);

  printf("signed int\n");
  printf("minimum value: %d\n", INT_MIN);
  printf("maximum value: %d\n\n", INT_MAX);

  printf("unsigned int\n");
  printf("minimum value: 0\n");
  printf("maximum value: %u\n\n", UINT_MAX);

  printf("signed long\n");
  printf("minimum value: %li\n", LONG_MIN);
  printf("maximum value: %li\n\n", LONG_MAX);

  printf("unsigned long\n");
  printf("minimum value: 0\n");
  printf("maximum value: %lu\n\n", ULONG_MAX);

  printf("signed long long\n");
  printf("minimum value: %lli\n", LLONG_MIN);
  printf("maximum value: %lli\n\n", LLONG_MAX);

  printf("unsigned long long\n");
  printf("minimum value: 0\n");
  printf("maximum value: %llu\n\n", ULLONG_MAX);
}

int factorial1(int n) {
  int res = 1;
  int i = 2;
  for (; i <= n; i++)
    res *= i;
  return res;
}

int factorial2(int n) {
  int res = 1;
  int i = 2;
  while (i <= n) {
    res *= i;
    i++;
  }
  return res;
}

int factorial3(int n) {
  int res = 1;
  int i = 1;
  do {
    res *= i;
    i++;
  } while (i <= n);
  return res;
}

int factorial4(int n) {
  if (n==0)
    return 1;
  else
    return n*factorial4(n-1);
}

void types() {
  char a1,a2,a3;
  short b1,b2,b3;
  int c1,c2,c3;
  double d1,d2,d3;

  printf("&a1 = %p, %u\n", &a1, &a1);
  printf("&a2 = %p, %u\n", &a2, &a2);
  printf("&a3 = %p, %u\n", &a3, &a3);
  printf("&b1 = %p, %u\n", &b1, &b1);
  printf("&b2 = %p, %u\n", &b2, &b2);
  printf("&b3 = %p, %u\n", &b3, &b3);
  printf("&c1 = %p, %u\n", &c1, &c1);
  printf("&c2 = %p, %u\n", &c2, &c2);
  printf("&c3 = %p, %u\n", &c3, &c3);
  printf("&d1 = %p, %u\n", &d1, &d1);
  printf("&d2 = %p, %u\n", &d2, &d2);
  printf("&d3 = %p, %u\n", &d3, &d3);
}



int main() {

  ranges();

  printf("factorial1(10) = %d\n", factorial1(10));
  printf("factorial2(10) = %d\n", factorial2(10));
  printf("factorial3(10) = %d\n", factorial3(10));
  printf("factorial4(10) = %d\n", factorial3(10));
  printf("\n");

  types();

  return 0;
}
