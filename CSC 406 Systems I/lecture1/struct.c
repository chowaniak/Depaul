#include <stdio.h>

int main(){
  struct employee {
    char *first;
    char *last;
    int age;
  };

  struct employee e = {"Sam", "Smith", 55};

  printf("%s %s, age %d\n", e.first, e.last, e.age);

  return 0;
}
