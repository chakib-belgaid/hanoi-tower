#!/bin/bash 

mkdir "bank.$1_$2.$3"
cp 'wrapper.ipynb'  "bank.$1_$2.$3"
cp 'launcher.sh'  "bank.$1_$2.$3"


cd "bank.$1_$2.$3"


#other languages 
./launcher.sh hannoi_java_rec $1 $2 $3 & 
./launcher.sh hannoi_python_rec $1 $2 $3 &


#with no optimisations  

./launcher.sh hannoi_c_rec $1 $2 $3 &
./launcher.sh hannoi_cpp_rec $1 $2 $3 &

#with optimisation o2 
./launcher.sh hannoi_c_rec:o2 $1 $2 $3 &
./launcher.sh hannoi_cpp_rec:o2 $1 $2 $3 &

#with optimisation o1 
./launcher.sh hannoi_c_rec:o1 $1 $2 $3 &
./launcher.sh hannoi_cpp_rec:o1 $1 $2 $3 &

#with optimisation o3 
source launcher.sh hannoi_c_rec:o3 $1 $2 $3 &
source launcher.sh hannoi_cpp_rec:o3 $1 $2 $3 &

