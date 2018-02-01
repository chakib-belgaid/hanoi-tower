
FROM powerapi:latest 

LABEL Name=hannoi_java_rec Version=0.0.1
RUN apt-get update  && apt-get -y install openjdk-8-jdk
ADD Hannoi_rec.java .
RUN javac Hannoi_rec.java  

ENTRYPOINT [ "taskset","-c","0","./analyse.sh" ,"java" ,"Hannoi_rec" ]
CMD ["21"]
