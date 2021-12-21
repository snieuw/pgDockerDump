# build our backup image
FROM postgres:13.4-alpine

ADD entrypoint.sh /app/entrypoint.sh
RUN apk add --update curl && rm -rf /var/cache/apk/*

ENTRYPOINT [ "/app/entrypoint.sh" ]
