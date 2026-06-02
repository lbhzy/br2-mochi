FROM alpine:3.23.4

RUN apk update && apk add --no-cache \
    alpine-base

RUN rm -rf /var/cache/apk/*

RUN passwd -d root

COPY inittab /etc/inittab
