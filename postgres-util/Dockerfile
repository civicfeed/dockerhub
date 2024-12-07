# -----------------------------------------------------------------------------
ARG POSTGRES_VERSION
FROM postgres:$POSTGRES_VERSION
ARG TARGETARCH

WORKDIR /app

COPY ./pgdump.sh /usr/bin

