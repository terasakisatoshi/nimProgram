#include<stdlib.h>

int get_head_element(int* a) {
    return a[0];
}

void fill_ones(int* a, int size) {
    for (int i = 0; i < size; i++) {
        a[i] = 1;
    }
}

int* minus_one(int* a, int size) {
    int* b = (int*)malloc(sizeof(int));
    for (int i = 0; i < size; i++) {
        b[i] = a[i] - 1;
    }
    return b;
}