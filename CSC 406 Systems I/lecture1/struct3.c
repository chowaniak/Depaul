#include <stdio.h>
#include <stdlib.h>

int main(){
  typedef struct {
    char *first;
    char *last;
    int age;
  } employee;

  employee *eptr;
  eptr = (employee *) malloc(12);
  (*eptr).first = "Sam";
  (*eptr).last = "Smith";
  (*eptr).age = 55;

  // alternative notation
  eptr->first = "Sam";
  eptr->last = "Smith";
  eptr->age = 55;

  printf("%s %s, age %d\n", (*eptr).first, (*eptr).last, (*eptr).age);

  // alternative notation
  printf("%s %s, age %d\n", eptr->first, eptr->last, eptr->age);

  return 0;
}
