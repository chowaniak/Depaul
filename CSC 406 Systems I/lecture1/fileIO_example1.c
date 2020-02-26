#include <stdio.h>   // to use printf, FILE, fopen, fgets, fclose

int main()
{
  char buf[1000];    // an array of characters for storing a line

  FILE* fp = fopen("test.txt", "r");  // open file

  while( fgets(buf, 1000, fp) != NULL) {
    // repeatedly read a file line into buf until end of file
    // and print content of buf (i.e. the line)
    printf("%s", buf);
  }

  fclose(fp);        // close the file

  return 0;
}
