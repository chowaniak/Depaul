#include <stdio.h>
#include <stdlib.h>

// Problem 1
long sum(long a[], long n) {
 /* Implement function sum() that takes as input an array of integers a and
 an integer n and sums up the first n integers of array a.*/                    
  long total = 0;
  int i;
  for ( i = 0; i < n; i++){
    total += a[i];}
  return total;
}


// Problem 2
int decode2 (int x, int y, int z) {

    long temp1 = y-z;
    long temp2 = x*temp1;
    long temp3 = (temp1<<63)>>63;
    long temp4 = temp3 ^ temp2;
    return temp4;
  } 



// Problem 3
// Write here AS A COMMENT the assembly code corresponding to
// the body of the for loop you implemented in function sum
/*
.L3:
        movslq  %edx, %rcx
        addq    (%rdi,%rcx,8), %rax
        addl    $1, %edx
.L2:
        movslq  %edx, %rcx
        cmpq    %rsi, %rcx
        jl      .L3
        rep ret
        .cfi_endproc
 */





void main () {
  // test function sum implementation; do not modify!

  long a[8] = {10, 8, 6 , 4, 2, 0, -2, -4};
  printf("sum(a, 8) = %d\n", sum(a, 8));
}
