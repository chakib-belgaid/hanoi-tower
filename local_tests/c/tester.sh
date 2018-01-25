#!/bin/bash

watcher()
{
    
    ../hannoi_rec $1 > /dev/null & 
    pid=$!
    powerapi modules procfs-cpu-simple \
    monitor \
        --frequency 1000 \
        --pids "$pid" \
        --file "c_rec2.$1.$2.log" &
    wait $pid
    sleep 1 
    kill -9 $!

    echo "##--##" >> "c_rec2.$1.$2.events"
    cat "c_rec2.$1.$2.log" |egrep -o "timestamp=[0-9]*;|power=.*" >> "c_rec2.$1.$2.events"

}


mkdir "testhannoi_c_rec"
    cd "testhannoi_c_rec"
for (( i=1 ; i<=$2;i++ ))
do 
watcher $1 $i 

done 