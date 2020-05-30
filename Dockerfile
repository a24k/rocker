FROM a24k/rocker:latest-armv6hf

COPY ./cross /host

WORKDIR /tmp

RUN /host/06-alsa.sh

RUN mkdir -p /project

WORKDIR /project
