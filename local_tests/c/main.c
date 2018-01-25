#include <stdio.h>
#include <stdlib.h> 

void move(int n, int from, int to, int via)
{
  if (n > 0) {
    move(n - 1, from, via, to);
    printf("Move disk %d from pole %d to pole %d\n",n, from, to);
    move(n - 1, via, to, from);
  }
}
int main(int argc , char **argv )
{   int disks = (argc >1 )? atoi(argv[1]): 5; 
  move(disks, 1,2,3);
  return 0;
}