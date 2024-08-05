FROM golang:alpine3.17 AS builder
WORKDIR /app
COPY ./main.go . 
RUN go mod init exercise-backend
RUN go get github.com/gorilla/mux && go get github.com/go-sql-driver/mysql && go get github.com/joho/godotenv
RUN go build main.go

FROM alpine:latest
WORKDIR /
COPY --from=builder /app/main /
EXPOSE 9080
ENTRYPOINT [ "/main" ]
 