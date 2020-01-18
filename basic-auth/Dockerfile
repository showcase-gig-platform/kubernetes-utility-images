FROM nginx:1.16-alpine

RUN apk add --no-cache --update apache2-utils tini
RUN rm -f /etc/nginx/conf.d/*

COPY entrypoint.sh /entrypoint.sh
COPY default.conf /etc/nginx/conf.d/default.conf

ENTRYPOINT [ "/sbin/tini", "--" ]
CMD [ "/bin/sh", "/entrypoint.sh" ]
