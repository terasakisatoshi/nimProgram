#include<stdio.h>
#include "mystruct.h"

MyStruct printMyStruct(MyStruct mystr){
    printf("from c\t: -.x = %d\n",mystr.x);
    printf("from c\t: -.y = %d\n",mystr.y);
    return mystr;
}