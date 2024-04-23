 #include<cuda.h>
 #include<stdio.h>
 #include<cuda_runtime.h>
 #include<assert.h>
 __global__ void kernel1(){
  printf("Hello world\n");
 }
 __global__ void kernel2(){
  printf("hello world2\n");
 }
 int main()
 {
  kernel1<<<1,1>>>();
  kernel2<<<1,1>>>();
  //printf("on CPU\n");
  cudaDeviceSynchronize();
  printf("on CPU\n");

  return 0;
 }
 