
# -----------------------------------------------------------------------------
FROM python:3.10-slim-bookworm AS builder

# Setup env
ENV LANG C.UTF-8
ENV LC_ALL C.UTF-8
ENV PYTHONDONTWRITEBYTECODE 1
ENV PYTHONFAULTHANDLER 1

WORKDIR /app

# install all packages
RUN apt-get clean && apt-get update && \
    apt-get install -y curl git librdkafka-dev libsnappy-dev protobuf-compiler gcc g++

# create python user and group
RUN adduser python

# security best practices, use the root group
RUN chown python:root ./

ENV PATH="/root/.local/bin:$PATH"

# mark github.com as known host
RUN mkdir -p -m 0700 ~/.ssh && ssh-keyscan github.com >> ~/.ssh/known_hosts
RUN pip install --upgrade pip setuptools wheel && \
    pip install pipenv

RUN PIPENV_VENV_IN_PROJECT=1 pipenv install -v --deploy
