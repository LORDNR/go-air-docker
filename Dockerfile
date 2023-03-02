# syntax=docker/dockerfile:1

FROM golang:1.19 as base

FROM base as dev

WORKDIR /app

COPY . .

RUN go get .

RUN curl -sSfL https://raw.githubusercontent.com/cosmtrek/air/master/install.sh | sh -s -- -b $(go env GOPATH)/bin

EXPOSE 8080
# ENV TZ=Asia/Bangkok
CMD ["air"]


