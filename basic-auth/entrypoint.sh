#!/bin/sh

USERNAME=${USERNAME:=admin}
PASSWORD=${PASSWORD:=password}
LISTEN_PORT=${LISTEN_PORT:-80}
SERVER_NAME=${SERVER_NAME:-localhost}
PROXY_PASS=${PROXY_PASS:-http://localhost/}

htpasswd -bBc /etc/nginx/.htpasswd ${USERNAME} ${PASSWORD}
sed -i -e "s#{{LISTEN_PORT}}#${LISTEN_PORT}#" -e "s#{{SERVER_NAME}}#${SERVER_NAME}#" -e "s#{{PROXY_PASS}}#${PROXY_PASS}#" /etc/nginx/conf.d/default.conf

nginx -g "daemon off;"
