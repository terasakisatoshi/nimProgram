#include<stdio.h>

extern int fillOnes(int* data, size_t* length);

int main(int argc, char const *argv[])
{
    int arr[100];
    size_t size = sizeof(arr);
    fillOnes(arr, &size);
    for (int i = 0; i < size; ++i)
    {
        printf("arr[%d]=%d\n", i, arr[i]);
    }
    return 0;
}