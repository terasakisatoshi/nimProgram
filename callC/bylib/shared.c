void fill_one(int* arr, int size) {
    for (int i = 0; i < size; i++) {
        arr[i] = 1;
    }
}

float get_average(int* arr, int size) {
    float sum = 0.0;
    for (int i = 0; i <= size; i++) {
        sum += arr[i];
    }
    return sum / size;
}