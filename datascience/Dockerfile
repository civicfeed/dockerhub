# -----------------------------------------------------------------------------
# python:3.10-slim-bookworm AS builder
FROM rapidsai/base:24.06-cuda12.2-py3.10 as builder 
ARG TARGETARCH
# Setup env
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1

WORKDIR /app

# install all packages
USER root
RUN apt-get clean && apt-get update && \
    apt-get install -y curl git librdkafka-dev libsnappy-dev protobuf-compiler gcc g++

# create python user and group
RUN adduser python

# security best practices, use the root grokeup
RUN chown python:root ./

ENV PATH="/root/.local/bin:$PATH"
ENV PIPENV_VENV_IN_PROJECT=1

# mark github.com as known host
RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN pip install --upgrade pip setuptools wheel && \
    pip install pipenv

COPY Pipfile* ./
RUN if [ "$TARGETARCH" = "arm64" ]; then \ 
        cp Pipfile.lock.arm64 ./Pipfile.lock; \
    else \
        cp Pipfile.lock.amd64 ./Pipfile.lock; \
    fi

RUN pipenv install --system -v --deploy --clear
