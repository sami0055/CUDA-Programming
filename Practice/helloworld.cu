#include<stdio.h> 
#include<assert.h>
#include<cuda.h>
#include<cuda_runtime.h>

__global__ void cuda_hello(){
    printf("Hello World from GPU!\n");
}

int main() {
    cuda_hello<<<1,1>>>(); 
    cudaDeviceSynchronize();
    return 0;
}