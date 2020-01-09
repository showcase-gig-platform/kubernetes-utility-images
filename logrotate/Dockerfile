FROM alpine:3.11

LABEL maintainer "masahata <buildsville.lab@gmail.com>"

RUN apk add --no-cache tini logrotate

RUN ls -l
RUN pwd

COPY crontab /etc/crontabs/root

ENTRYPOINT ["/sbin/tini", "--"]

CMD ["/usr/sbin/crond", "-f"]
