# Build stage
FROM golang:1.24 AS builder
WORKDIR /go/src/app
COPY . .
RUN go mod download
RUN make build

# Final stage
FROM alpine:latest
WORKDIR /app
COPY --from=builder /go/src/app/kbot .
RUN apk add --no-cache ca-certificates
ENTRYPOINT ["./kbot"]
