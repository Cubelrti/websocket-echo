FROM jmalloc/echo-server as echo-server
FROM alpine

COPY --from=echo-server /bin/echo-server /bin/echo-server

RUN sed -i 's/dl-cdn.alpinelinux.org/mirrors.tencent.com/g' /etc/apk/repositories \
    && apk add --update --no-cache nodejs \
    && rm -f /var/cache/apk/*

RUN npm install -g wscat --registry=https://registry.npmmirror.com

ENTRYPOINT [ "/bin/echo-server" ]
