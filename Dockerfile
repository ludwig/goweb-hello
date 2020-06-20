FROM golang:1.14-alpine AS builder
RUN apk update && apk add --no-cache git
WORKDIR /go/src/github.com/ludwig/goweb-hello/
COPY hello.go .
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o hello .

FROM scratch
COPY --from=builder /go/src/github.com/ludwig/goweb-hello/hello /go/bin/hello
CMD ["/go/bin/hello"]
