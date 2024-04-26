 #include <stdio.h>
#include<cuda.h>
#include<assert.h>
#include<cuda_runtime.h>
#define N 32
#define THREADS_PER_BLOCK 32

__global__ void initializeArray(int *arr) {
    int idx = threadIdx.x;
    
    if (idx < N) {
        arr[idx] = idx;
    }
}

int main() {
    int arr[N];
    int *d_arr;
    int size = N * sizeof(int);
    
    // Allocate memory on device
    cudaMalloc(&d_arr, size);
    
    // Initialize array on device
    initializeArray<<<1,32>>>(d_arr);
    
    // Copy data back to host
    cudaMemcpy(arr, d_arr, size, cudaMemcpyDeviceToHost);
    
    // Output the initialized array
    printf("Initialized array:\n");
    for (int i = 0; i < N; i++) {
        printf("%d ", arr[i]);
    }
    printf("\n");
    
    // Free device memory
    cudaFree(d_arr);
    
    return 0;
}
