#!/bin/bash

watcher()
{
    java hannoi_rec $1 > /dev/null & 
    pid=$!
    powerapi modules procfs-cpu-simple \
    monitor \
        --frequency 1000 \
        --pids "$pid" \
        --file "java_rec2$1.$2.log" &
    wait $pid
    sleep 1 
    kill -9 $!
    cat "java_rec2.$1.$2.log" |egrep -o "power=.*" >> "java_rec2$1.$2.events"

}

mkdir "tests"
cp hannoi_rec.class "java_rec"
cd "java_rec"

for (( i=1 ; i<=10;i++ ))
do 
watcher 24 $i 

done 

rm -f "hannoi_rec.class"