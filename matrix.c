#include <stdlib.h>
#include <math.h>
#include "matrix.h"

float ValMatr[30];

void MatrixFunction(){
  int I;
  printf("An example with a matrix has been launched.\n");
  for (I=0;I<29;I++){
    ValMatr[I] = 20*sin(I/10.0); 
  }
  printf(" %d.\n",ValMatr[0]); 
}
