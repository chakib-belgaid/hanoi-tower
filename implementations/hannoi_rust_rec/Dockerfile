
FROM powerapi:latest
LABEL Name=hannoi_rust_rec Version=0.0.1
RUN apt-get -y update && apt-get -y install rustc 
ADD hannoi.rs .
RUN rustc  -C opt-level=3 hannoi.rs

ENTRYPOINT ["./analyse.sh","./hannoi"]
CMD ["21"]