FROM golang:latest

RUN mkdir /build/
WORKDIR /build

RUN export GO111MODULE=on

COPY go.mod /build
COPY go.sum /build/

RUN cd /build/ && git clone https://github.com/linedejgaard/DISYS_docker_exercise.git
RUN cd /build/DISYS_docker_exercise/server && go build ./...

EXPOSE 9080

ENTRYPOINT [ "/build/DISYS_docker_exercise/server/server" ]


