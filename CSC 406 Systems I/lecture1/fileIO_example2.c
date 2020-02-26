#include <stdio.h>   // to use printf, FILE, fopen, fgets, fclose, sscanf  

int main()
{
  char buf[1000];    // an array of characters for storing a line
  char c;
  unsigned int a;
  int b;

  FILE* fp = fopen("test.txt", "r");  // open file

  while( fgets(buf, 1000, fp) != NULL) {
    if (buf[0] == ' ') {
      sscanf(buf, " %c %u,:,%d", &c, &a, &b);
      printf("%u %d\n", a, b);
    }
  }

  fclose(fp);        // close the file

  return 0;
}



