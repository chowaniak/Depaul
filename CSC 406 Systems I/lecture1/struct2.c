#include <stdio.h>

int main(){
  typedef struct {
    char *first;
    char *last;
    int age;
  } employee;

  employee e = {"Sam", "Smith", 55};

  printf("%s %s, age %d\n", e.first, e.last, e.age);

  return 0;
}
