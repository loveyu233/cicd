FROM golang:1.20.6-alpine3.18 AS build

WORKDIR /app

COPY . .

ENV GOPROXY=https://goproxy.cn

RUN go mod tidy && go build main.go

FROM alpine:3.18

WORKDIR /app

COPY --from=build /app/main .

EXPOSE 9999

CMD ["./main"]