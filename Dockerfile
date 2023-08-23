FROM golang:alpine AS builder

WORKDIR $GOPATH/src/main/fullcycle

COPY . .

RUN go build -o /go/bin/fullcycle

FROM scratch

COPY --from=builder /go/bin/fullcycle /fullcycle

ENTRYPOINT [ "/fullcycle" ]