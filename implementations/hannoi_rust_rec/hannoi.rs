use std::env;

fn move_(disk:i32, from : i32 , to : i32 , via :i32  ) 
{
    if disk >0 
    {
        move_ (disk -1 , from , via, to ); 
        //println!("Move disk from pole {} to pole {}", from, to);
        move_ (disk -1 , via, to , from); 
    }
}

fn main( )
 {
     let args : Vec<String> = env::args().collect(); 
     let disks = if args.len() > 1  {args[1].parse::<i32>().unwrap()} else  { 5 } ; 
     move_(disks,1,2,3)
 }

