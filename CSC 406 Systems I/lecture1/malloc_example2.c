#include <stdlib.h>  // to use malloc, free 
#include <stdio.h>

typedef unsigned int addr_t;    // define memory address type

typedef struct {                // define new struct type for storing
  int a;                        // an integer and a memory address
  addr_t c;
} entry_t;

typedef entry_t* row_t;         // define row type
typedef row_t* table_t;         // define table type

table_t t;

int main () {

  int num_rows = 2;
  int num_columns = 3;

  int i,j;
  t = (row_t*) malloc(sizeof(row_t) * num_rows);
  for (i=0; i<num_rows; i++){
    t[i]=(entry_t*) malloc(sizeof(entry_t) * num_columns);
    for (j=0; j<num_columns; j++){
      t[i][j].a = i;
      t[i][j].c = j;
    }
  }

  for (i=0; i<num_rows; i++){
    for (j=0; j<num_columns; j++)
      printf("%d%u ", t[i][j].a, t[i][j].c);
    printf("\n");
  }

  for (i=0; i<num_rows; i++){
    free(t[i]);
  }
  free(t);

  return 0;
}
