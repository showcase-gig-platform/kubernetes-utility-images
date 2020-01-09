FROM alpine:3.11

LABEL maintainer "masahata <buildsville.lab@gmail.com>"

RUN apk add --no-cache tini

ENTRYPOINT ["/sbin/tini", "--"]
