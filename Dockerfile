FROM golang AS builder

COPY ./hello/hello . 

FROM scratch

COPY --from=builder ./go/hello .

CMD [ "./hello" ]