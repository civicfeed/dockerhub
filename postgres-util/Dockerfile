# -----------------------------------------------------------------------------
ARG POSTGRES_VERSION="latest"
FROM postgres:$POSTGRES_VERSION
ARG TARGETARCH

WORKDIR /app

COPY ./pgdump.sh /usr/bin

