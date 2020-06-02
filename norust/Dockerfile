FROM ubuntu:20.04

COPY . /host

WORKDIR /tmp

RUN /host/01-apt-get.sh \
    && /host/02-download-gcc.sh \
    && /host/03-build-gcc.sh \
    && /host/04-cleanup.sh

ENV PATH=/usr/local/sbin:/usr/local/bin:/usr/sbin:/usr/bin:/sbin:/bin

RUN mkdir -p /project

WORKDIR /project
