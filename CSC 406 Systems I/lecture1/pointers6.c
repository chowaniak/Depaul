#include <stdio.h>

int main()
{
    int *iptr;
    int val = 12;
    iptr = &val;

    printf("val = %d\n", val);
    printf("sizeof(int) = %d\n", sizeof(int));
    printf("iptr     = %p\n", iptr);
    printf("iptr + 1 = %p\n", iptr+1);
    printf("iptr + 2 = %p\n", iptr+2);

    char *cptr;
    cptr = (char *) &val;

    printf("cptr     = %p\n", cptr);
    printf("cptr + 1 = %p\n", cptr+1);
    printf("cptr + 2 = %p\n", cptr+2);
    printf("cptr + 3 = %p\n", cptr+3);

    printf("*iptr     = %x\n", *iptr);
    printf("*cptr     = %x\n", *cptr);
    printf("*(cptr+1) = %x\n", *(cptr+1));
    printf("*(cptr+2) = %x\n", *(cptr+2));
    printf("*(cptr+3) = %x\n", *(cptr+3));

    return 0;
}
