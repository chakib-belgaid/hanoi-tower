
#build stage
FROM golang:alpine AS builder
WORKDIR /go/src/app
COPY hannoi.go .
#RUN apk add --no-cache git
RUN go-wrapper download   # "go get -d -v ./..."
RUN go-wrapper install    # "go install -v ./..."

#final stage
#build stage
FROM powerapi:latest
LABEL Name=hanoi_tower_go_rec Version=0.0.1 
COPY --from=builder /go/bin/app /app
ENTRYPOINT ["./analyse.sh","./app"]
CMD ["21"]

