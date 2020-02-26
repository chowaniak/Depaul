#include <stdlib.h>
#include <stdio.h>
#include <string.h>
#include <pthread.h>

const int MAX_LINE = 256;




//in general: get a string as input and print each substrings, which are separeted by commas.


int main()
{
 //char *text= "Hello,Word,";
 char *text; // all strings are arrays of pointers
 
    printf("Please enter a line of text: ");
   fgets(text,MAX_LINE,stdin);
    //To get rid of the annoying \n char that fgets() adds to the end of entered strings
    char* cPtr = strchr(text,'\n');
    if  (cPtr != NULL)
        *cPtr = '\0';
   


 // this is needed to separete words
 char sep = ',';
  
  // lenth of array/string is needed for the loop 
  int n= strlen(text); //stringlength

  int i;
  
  // this loop prints char after char from entered text
  for ( i=0; i <n;i++)
   // if a char is equal to comma, than I add a new line
    if (text[i] == sep)
    printf("\n");
   else
  // if char is something other then comma than i print it
    printf("%c",text[i]);
    

return (0);
}

    
