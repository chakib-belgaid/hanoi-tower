
FROM java:8
COPY . /var/www/java  
WORKDIR /var/www/java  
LABEL Name=hannoi_java_rec Version=0.0.1
RUN javac hanoi.java  
ENTRYPOINT  ["java", "hanoi_rec" ]