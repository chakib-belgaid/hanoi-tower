
FROM powerapi:latest
LABEL Name=hanoi_tower_cpp_rec Version=0.0.1 
RUN apt-get -y update && apt-get -y install g++ 
ADD main.cpp .
RUN g++  main.cpp  -O1 -o hanoirec
ENTRYPOINT ["./analyse.sh","./hanoirec"]
CMD ["21"]