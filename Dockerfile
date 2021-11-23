FROM golang:latest
WORKDIR /go/src/github.com/gempir/justlog
COPY . .
RUN go get ./...
RUN CGO_ENABLED=0 GOOS=linux go build -a -installsuffix cgo -o app .

FROM alpine:latest  

RUN apk --no-cache add ca-certificates

RUN adduser justlog -D

COPY docker-entrypoint.sh .
COPY --from=0 /go/src/github.com/gempir/justlog/app .

ENTRYPOINT /docker-entrypoint.sh

EXPOSE 8025