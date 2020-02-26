#include <stdio.h>

int main(){

  char s[10] = "hello";
  int i = -1;

  do {
    i += 1;
    printf("%c\t%x\n", s[i], s[i]);
  } while (s[i] != '\0');

  return 0;
}
