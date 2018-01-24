
#include <iostream>
#include <stdlib.h>

using namespace std;


void move(int n, int from, int to, int via) {
  if (n >= 1) {
    move(n - 1, from, via, to);
    std::cout << "Move disk " << n << " from pole " << from << " to pole " << to << std::endl;
    move(n - 1, via, to, from);
  }
}

int main(int argc , char **argv )
{   int disks = (argc >1 )? atoi(argv[1]): 5; 
  move(disks, 1,2,3);
  return 0;
}