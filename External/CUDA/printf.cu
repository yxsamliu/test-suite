#include "hip/hip_runtime.h"
__global__ void kernel(char a, short b, int c, float d, double e) {
  const char* f = "abcdefg";
  printf("kernel_printf %c %d %d %f %f %s\n", a, b, c, d, e, f);
}

int main(int argc, char* argv[]) {
  hipLaunchKernelGGL((kernel), dim3(2), dim3(8), 0, 0, 'a', 2, 3, 4, 5);
  hipDeviceSynchronize();
  hipDeviceReset();
  return 0;
}
