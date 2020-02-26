#include <stdio.h>

long switch_prob(long x, long n){
 
 long result = x;

  switch(n) {

  case 1:
   result = 8*x;
   break;
  case 2:
   result = x>>3;
   break;
  case 3:
   result = result - (x<<4);
  case 4:
    result = x*x;
  case 5:
  default:
  result = x +75;
  break;
  }
  return result;
}


void main(){
printf("result=%ld\n", switch_prob(10,10));



}
