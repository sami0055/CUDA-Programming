#include<stdio.h>
#include<assert.h>
#include<cuda.h>
#include<cuda_runtime.h>
__global__ void kernel(unsigned *matrix){
  unsigned id=blockIdx.x*blockDim.x+threadIdx.x;
  //blockDim=6 blockIdx= 0-4 threadIdx=0-5
  matrix[id]=id;
}
#define N 5
#define M 6

int main(){
unsigned *matrix,*hmatrix;
cudaMalloc(&matrix,N*M*sizeof(unsigned));
hmatrix=(unsigned*)malloc(N*M*sizeof(unsigned));
kernel<<<N,M>>>(matrix);
cudaMemcpy(hmatrix,matrix,N*M*sizeof(unsigned),cudaMemcpyDeviceToHost);
for(unsigned i=0; i<N; i++)
{
  for(unsigned j=0; j<M; j++)
  {
    printf("%d ",hmatrix[i*M+j]);
  }
  printf("\n");
}
return 0;

}