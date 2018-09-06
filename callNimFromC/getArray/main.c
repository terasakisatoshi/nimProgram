#include<stdio.h>
#include<stdlib.h>

extern void* test_arr();

int main(int argc, char const *argv[])
{
    float* a = (float*)test_arr();
    printf("%f\n", a[-1]); //dangerous
    printf("%f\n", a[0]);
    printf("%f\n", a[1]);
    printf("%f\n", a[2]);
    printf("%f\n", a[3]); //dangerous
    return 0;
}