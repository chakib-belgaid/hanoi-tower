#!/bin/bash 
watcher()
{
echo "running $1 with $2 tours iter n°$3"
docker events --filter "image=$1" --format 'time ={{.Time}} status ={{.Status }} id ={{.ID}}'  > "$1.$2.$3.events"  & 
watcher=$!
name=$(echo "$1" | tr ':' _  ) 
docker run -d --rm --name $name $1 $2 
powerapi  modules procfs-cpu-simple \
monitor \
    --frequency 1000 \
    --containers $(docker inspect --format="{{.Id}}" $name ) \
--file "$1.$2.$3.log"  & 
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
if [ "$#" -eq 4 ];
then 
    mindisk=$2
    maxdisk=$3
    numberiter=$4
else 
    mindisk=22
    maxdisk=23
    numberiter=5
fi

for ((k=1; k <= $numberiter; k++))
do 
    
    for (( i=$mindisk ; i <= $maxdisk; i++ ))
    do 
        watcher $container $i $k
    done 
done        