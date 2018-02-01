
FROM powerapi:latest
LABEL Name=hannoi_python_rec Version=0.0.1
RUN apt-get -y update && apt-get -y install python3
ADD hannoi_rec.py . 
ENTRYPOINT [ "./analyse.sh" ,"python3" ,"hannoi_rec.py" ]
CMD ["21"]
