# build our backup image
FROM postgres:11.6

ADD entrypoint.sh /app/entrypoint.sh

ENTRYPOINT [ "/app/entrypoint.sh" ]
