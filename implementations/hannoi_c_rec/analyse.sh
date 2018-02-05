#!/bin/bash    
    
$@ >> /dev/null & 
pid=$!
#echo $pid
powerapi modules procfs-cpu-simple   monitor --frequency 1000  --pids "$pid" --file "Sample.log" &
pidapi=$!
wait $pid
sleep 1 
kill -9 $pidapi &
echo "0" >"Sample.power"
cat "Sample.log" |egrep -o "power=.*" |  tr -d 'power=|mW'  >> "Sample.power" 
awk '{s+=$1} END {print s}' "Sample.power"
rm -f "Sample.log"

#echo "hello world"