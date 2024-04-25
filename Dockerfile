ARG PG_TAG=13.4-alpine
FROM postgres:$PG_TAG

RUN which crond && \
    rm -rf /etc/periodic

COPY runBackup.sh /app/runBackup.sh
#ADD entrypoint.sh /app/entrypoint.sh

RUN apk add --update curl && rm -rf /var/cache/apk/*

RUN chmod +x /app/runBackup.sh


ENTRYPOINT [ "/app/entrypoint.sh" ]

