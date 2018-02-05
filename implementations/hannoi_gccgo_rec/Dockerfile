FROM powerapi:latest
LABEL Name=hannoi_gccgo_rec Version=0.0.1
RUN apt-get -y update && apt-get -y install gccgo 
ADD hannoi.go .
RUN gccgo hannoi.go -O3 -o hannoi
ENTRYPOINT ["./analyse.sh","./hannoi"]
CMD ["21"]