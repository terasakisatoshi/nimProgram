#include "fib.h"
#include <stdio.h>

int main(void)
{
    NimMain();
    auto seq = get_seq(3);
    auto arr = get_arr();
    for (int f = -10; f < 10; f++) {
        //printf("Fib of %d is %d\n", f, fib(f));
        printf("seq %d\n", *(seq + f));
        printf("arr %d\n", *(arr + f));

    }
    return 0;
}