
public class Hannoi_rec {

     static void move(int n, int from, int to, int via) {
        if (n >= 1)  
        {  
          move(n - 1, from, via, to);
          System.out.println("Move disk "+n +" from pole " + from + " to pole " + to);
          move(n - 1, via, to, from);
        }
     }

    public static void main(String[] args) {
      int disk =  (args.length >= 1) ? Integer.parseInt(args[0]) : 10 ; 
      move(disk, 1,2,3);
    }
 }