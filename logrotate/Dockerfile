FROM alpine:3.11

LABEL maintainer "masahata <buildsville.lab@gmail.com>"

RUN apk add --no-cache tini logrotate

COPY crontab /etc/crontabs/root
COPY crontab /etc/crontabs/nobody

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/usr/sbin/crond", "-f"]
