/*
 ============================================================================
 Author        : G. Barlas
 Version       : 1.0
 Last modified : December 2014
 License       : Released under the GNU GPL 3.0
 Description   : 
 To build use  : nvcc hello2.cu -o hello2 -arch=sm_20 
 ============================================================================
 */
#include <stdio.h>
#include <cuda.h>

__global__ void hello ()
{
  int myID = ( blockIdx.y * gridDim.x + 
               blockIdx.x ) * blockDim.x * blockDim.y * blockDim.z + 
               threadIdx.y * blockDim.x + 
               threadIdx.x; 
   if (myID>=131071) {
	 printf("z id %i", blockIdx.z);
      printf ("Hello world from %i\n", myID);
   }
}

int main ()
{
  dim3 g (8, 32);
  dim3 b (32, 16);
  hello <<< g, b >>> ();
  cudaThreadSynchronize ();
  return 0;
}
