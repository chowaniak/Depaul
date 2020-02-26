#include <getopt.h>
#include <unistd.h>
#include <stdlib.h>
#include <stdio.h>

int a  = 0;
char* b = NULL;
int flagc = 0;
int flagd = 0;

int main(int argc, char* argv[])
{
  char c;

  while( (c=getopt(argc,argv,"a:b:cd")) != -1){
    switch(c){
    case 'a':
      a = atoi(optarg);
      break;
    case 'b':
      b = optarg;
      break;
    case 'c':
      flagc = 1;
      break;
    case 'd':
      flagd = 1;
      break;
    default:
      printf("ERROR!");
      exit(1);
    }
  }
  printf("a = %d, b = %s, flagc = %d, flagd = %d\n", a, b, flagc, flagd);
  return 0;
}
