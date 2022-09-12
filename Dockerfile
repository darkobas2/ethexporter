FROM golang

ADD . /go/src/github.com/hunterlong/ethexporter
WORKDIR /go/src/github.com/hunterlong/ethexporter
RUN go mod tidy
RUN go install

ENV GETH $GETH
ENV PORT $PORT
ENV ADDRESSES $ADDRESSES

RUN mkdir /app
WORKDIR /app
#ADD addresses.txt /app

EXPOSE ${PORT}

CMD ["/bin/bash", "-c", "echo $ADDRESSES > /app/addresses.txt && /go/bin/ethexporter"]
