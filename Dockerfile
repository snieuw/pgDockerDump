# build our backup image
FROM postgres:13.4

ADD entrypoint.sh /app/entrypoint.sh

ENTRYPOINT [ "/app/entrypoint.sh" ]
