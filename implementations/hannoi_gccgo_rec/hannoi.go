package main

import "fmt"
import "os"
import "strconv"

func main() {
	disks := 5
	var err error
	if len(os.Args) > 1 {
		disks, err = strconv.Atoi(os.Args[1])
		if err != nil {
			fmt.Println(err)
		}
	}
	move(disks, 1, 2, 3)
}

func move(n, from, to, via int) {

	if n > 0 {
		move(n-1, from, to, via)
		//fmt.Println("Move disk ", n, " from ", from, " to ", to)
		move(n-1, via, from, to)
	}
}
