import sys 

def hanoi(ndisks, frome, to,via):
    if ndisks:
        hanoi(ndisks-1, frome,via,to)
        #print("Move disk %d from pole %d to pole %d" % (ndisks,frome,to))
        hanoi(ndisks-1,via,to,frome)
 

def main():
   if len(sys.argv) > 1:
      for arg in sys.argv[1:]:
         n = eval(arg)
         hanoi(n, 1, 2, 3)
   else:
         hanoi(10,1,2,3)

main()