FROM golang AS builder

RUN mkdir hello && \
    cd hello && \ 
    go mod init example/hello

WORKDIR /go/hello

COPY ./hello .

RUN go build

FROM scratch

COPY --from=builder ./go/hello .

CMD [ "./hello" ]