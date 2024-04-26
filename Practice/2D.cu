 #include<cuda.h>
 #include<stdio.h>
 #include<assert.h>
 #include<cuda_runtime.h>

 __global__ void kernel(unsigned *matrix){
  unsigned id= threadIdx.x*blockDim.y+threadIdx.y;
  matrix[id]=id;
 }
 #define N 5
 #define M 6
 int main(){
  dim3 block(N,M,1);
  unsigned *matrix,*hmatrix;
  cudaMalloc(&matrix,N*M*sizeof(unsigned));
  hmatrix=(unsigned*)malloc(N*M*sizeof(unsigned));
  kernel<<<1,block>>>(matrix);
  cudaMemcpy(hmatrix,matrix,N*M*sizeof(unsigned),cudaMemcpyDeviceToHost);
  for(unsigned i=0; i<N; i++){
    for(unsigned j=0; j<M; j++){
      printf("%d ",hmatrix[i*M+j]);
    }
    printf("\n");
  }
    return 0;
 }
