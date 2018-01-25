#!/bin/bash

watcher()
{
    java hannoi_rec $1 > /dev/null & 
    pid=$!
    powerapi modules procfs-cpu-simple \
    monitor \
        --frequency 1000 \
        --pids "$pid" \
        --file "java_rec2.$1.$2.log" &
    wait $pid
    sleep 1 
    kill -9 $!
    echo $pid >> "java_rec2.$1.$2.events"
    echo "##--##" >> "java_rec2.$1.$2.events"
    cat "java_rec2.$1.$2.log" |egrep -o "timestamp=[0-9]*;|power=.*" >> "java_rec2.$1.$2.events"

}

mkdir "testhannoi_java_rec"
cp hannoi_rec.class "testhannoi_java_rec"
cd "testhannoi_java_rec"

for (( i=1 ; i<=$2;i++ ))
do 
watcher $1 $i 

done 

rm -f "hannoi_rec.class"