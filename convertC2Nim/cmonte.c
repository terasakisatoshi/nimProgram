#include <time.h>
#include <stdio.h>
#include <stdlib.h>

//http://www.sat.t.u-tokyo.ac.jp/~omi/random_variables_generation.html#Uniform
double UniformRandom01(void){
    return ((double)rand()+1.0)/((double)RAND_MAX+2.0);
}
int main(void){
    srand(time(NULL));
    const int N=100000000;
    int counter=0;
    for (int i=0;i<N;++i){
        double x=UniformRandom01();
        double y=UniformRandom01();
        if (x*x+y*y<1.0){
            counter+=1;
        }
    }
    printf("approx pi is %f\n", 4*counter/(double)N);
}