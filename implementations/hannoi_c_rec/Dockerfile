FROM powerapi:latest
LABEL Name=hanoi_tower_c_rec Version=0.0.1 
RUN apt-get -y update && apt-get -y install gcc 

ADD main.c .
RUN gcc   main.c  -o  hanoirec

ENTRYPOINT ["./analyse.sh","./hanoirec"]
CMD ["21"]