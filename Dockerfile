
FROM alpine:latest
LABEL maintainer="Fork of prometheus-community/pgbouncer_exporter"
ARG TARGETARCH
COPY ./build/pgbouncer_exporter.${TARGETARCH} /bin/pgbouncer_exporter
COPY LICENSE                                /LICENSE
USER       nobody
ENV PGB_LISTEN_PORT="9127"
ENV PGB_DEBUG_LEVEL="info"

ENTRYPOINT /bin/pgbouncer_exporter --pgBouncer.connectionString "${PGB_CONNECTION_STRING}"  --log.level "${PGB_DEBUG_LEVEL}" --web.listen-address ":${PGB_LISTEN_PORT}"

EXPOSE     "${PGB_LISTEN_PORT}"
