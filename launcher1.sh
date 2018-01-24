#!/bin/bash 

watcher()
{
x=$1
name=${x//\:/\-}    
docker events --filter "image=$1" --format 'time ={{.Time}} status ={{.Status }} id ={{.ID}}'  > "$1.$2.$3.events"  & 
watcher=$!

docker run -d --rm --name $name $1 $2 
powerapi   modules procfs-cpu-simple \
monitor \
    --frequency 500 \
    --containers $(docker inspect --format="{{.Id}}" $name ) \
    --file "$1.$2.$3.log" --console & 
docker wait $name 
kill -9 $! 
sleep 1
kill -9 $watcher 
echo "##--##"  >> "$1.$2.$3.events"
cat "$1.$2.$3.log" | egrep -o "timestamp=[0-9]*;|power=.*"  >> "$1.$2.$3.events"

}


container=$1
mkdir "test$1"
cd "test$1"

for k in {1..5}
do 
    for i in {22..23}
    do 
        watcher $container $i $k
    done 
done        