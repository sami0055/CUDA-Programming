  #include<cuda.h>
 #include<stdio.h>
 #include<cuda_runtime.h>
 #include<assert.h>
  __global__ void kernel(){
  printf("Hello world\n");
 }

 int main(){
  kernel<<<1,32>>>();
  cudaDeviceSynchronize();
  return 0;
 }
 /*
   !nvcc multiplethread.cu -o multiplethread
   !./multiplethread
 */