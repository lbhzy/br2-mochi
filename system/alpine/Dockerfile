FROM alpine:3.23.4 AS builder

RUN apk update && apk add --no-cache \
    alpine-base

RUN rm -rf /var/cache/apk/*

RUN passwd -d root

COPY inittab /etc/inittab

RUN echo UNKNOWN >> /etc/securetty 

FROM scratch AS exporter
COPY --from=builder / /
