FROM gcc:5.4
LABEL Name=hanoi_tower_c_rec Version=0.0.1 
WORKDIR /hanoii
ADD . /hanoii
RUN apt-get -y update && apt-get install -y fortunes
RUN gcc   main.c  -o hanoirec
ENTRYPOINT ["./hanoirec"]