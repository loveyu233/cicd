FROM golang:1.20.6-alpine3.18 AS build

WORKDIR /app

COPY . .

ENV GOPROXY=https://goproxy.cn

RUN go mod tidy && go build -ldflags '-s -w' -o system_app main.go

FROM alpine:3.18

WORKDIR /app

COPY --from=build /app/system_app /app/
COPY --from=build /app/etc/* /app/etc/

CMD ["/app/system_app","-c","/app/etc/config.test.json"]