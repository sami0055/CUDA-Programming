 #include<stdio.h>
 #include<cuda.h>
 #include<assert.h>
 #include<cuda_runtime.h>
 const char *mgs="Hello world\n";
 //#define mgs "Hello world\n"
 __global__ void kernel(){
   printf(mgs);
 }
 int main(){
  kernel<<<1,32>>>(); // a error will give as kernel can't access cpu's memory
  cudaDeviceSynchronize();
  return 0;
 }