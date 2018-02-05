use std::env;

fn move_(disk:i32, from : i32 , to : i32 , via :i32 ,n : i32 ) 
{  // let mut i :i32=n;
    
    if disk == n 
    {
    println!("this is a thing")
    }
    if disk >0 
    {
        move_ (disk -1 , from , to, via,n ); 
        //println!("Move disk from pole {} to pole {}", from, to);
        move_ (disk -1 , via, to , from,n); 
    }

}

fn main( )
 {
     let args : Vec<String> = env::args().collect(); 
     let disks = if args.len() > 1  {args[1].parse::<i32>().unwrap()} else  { 5 } ; 
     move_(disks,1,2,3,disks);
     println!("hello");
 }

