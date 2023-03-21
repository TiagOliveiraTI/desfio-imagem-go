FROM golang:alpine AS builder

WORKDIR /go/src/app
COPY . .
RUN go build -o main .

FROM scratch
COPY --from=builder /go/src/app/main /app/
ENTRYPOINT ["/app/main"]