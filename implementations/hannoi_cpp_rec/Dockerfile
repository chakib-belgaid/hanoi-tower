
FROM gcc:5.4
LABEL Name=hannoi_cpp_rec Version=0.0.1
WORKDIR /hanoii
ADD . /hanoii
RUN apt-get -y update && apt-get install -y fortunes
RUN g++  main.cpp  -O3 -o hanoirec
ENTRYPOINT ["./hanoirec"]