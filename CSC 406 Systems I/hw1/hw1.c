#include <stdio.h>
#include <limits.h>

void ranges() {


  printf("\n");
  printf("Signed char \n");
  printf("Minimum Value %d\n",SCHAR_MIN);
  printf("Maximum Value %d\n",SCHAR_MAX);
  printf("\n");
  printf("Unsigned char \n");
  printf("Minimum Value 0\n");
  printf("Maximum Value %d\n",UCHAR_MAX);
  printf("\n");

  printf("\n");
  printf("Signed short \n");
  printf("Minimum Value %d\n",SHRT_MIN);
  printf("Maximum Value %d\n",SHRT_MAX);
  printf("\n");
  printf("Unsigned short \n");
  printf("Minimum Value 0\n");
  printf("Maximum Value %d\n",USHRT_MAX);
  printf("\n");

  printf("\n");
  printf("Signed int \n");
  printf("Minimum Value %d\n",INT_MIN);
  printf("Maximum Value %d\n",INT_MAX);
  printf("\n");

  printf("Unsigned int \n");
  printf("Minimum Value 0\n");
  printf("Maximum Value %u\n",UINT_MAX);
  printf("\n");


  printf("\n");
  printf("Signed long \n");
  printf("Minimum Value %li\n",LONG_MIN);
  printf("Maximum Value %li\n",LONG_MAX);
  printf("\n");
  printf("Unsigned long \n");
  printf("Minimum Value 0\n");
  printf("Maximum Value %lu\n",ULONG_MAX);
  printf("\n");

  printf("\n");
  printf("Signed long long \n");
  printf("Minimum Value %lli\n",LLONG_MIN);
  printf("Maximum Value %lli\n",LLONG_MAX);
  printf("\n");
  printf("Unsigned long long \n");
  printf("Minimum Value 0\n");
  printf("Maximum Value %llu\n",ULLONG_MAX);
  printf("\n");

}


 int factorial1(int n) {
 // implement using for loop
 int res = 1;
 int i=1;
 for(i;i<=n;i++){
   res*=i;
 }
 return res;
}

int factorial2(int n) {
// implement using while loop
  int res = 1;
  int i=1;
  while(i<=n){
    res*=i;
    i++;
}
return res;
}


int factorial3(int n) {
//implement using do-while loop
  int res = 1;
  int i =1;
  do {
    res*=i;
    i++;
}
  while (i<=n);

 return res;
}



int factorial4(int n) {
// implement using recursion

  if (n <= 1){
    return 1; }
  else{
    return factorial4(n-1)*n;}
}



void types() {

  char a1;
  char a2;
  char a3;
  
  short b1;
  short b2;
  short b3;
  
  int c1;
  int c2;
  int c3;
  
  double d1;
  double d2;
  double d3;
 
  printf("&a1 = %p, %u \n",&a1,&a1);
  printf("&a2 = %p, %u \n",&a2,&a2);
  printf("&a3 = %p, %u \n",&a3,&a3);

  printf("&b1 = %p, %u  \n",&b1,&b1);
  printf("&b2 = %p, %u  \n",&b2,&b2);
  printf("&b3 = %p, %u  \n",&b3,&b3);

  printf("&c1 = %p, %u  \n",&c1,&c1);
  printf("&c2 = %p, %u  \n",&c2,&c2);
  printf("&c3 = %p, %u  \n",&c3,&c3);

  printf("&d1 = %p, %u  \n",&d1,&d1);
  printf("&d2 = %p, %u  \n",&d2,&d2);
  printf("&d3 = %p, %u  \n",&d3,&d3);


}


// test code; do not modify
int main() {

  ranges();

  printf("factorial1(10) = %d\n", factorial1(10));
  printf("factorial2(10) = %d\n", factorial2(10));
  printf("factorial3(10) = %d\n", factorial3(10));
  printf("factorial4(10) = %d\n", factorial4(10));
  printf("\n");

  types();

  return 0;
}
