FROM a24k/rocker:latest-armv6hf-alsa

COPY . /host

WORKDIR /tmp

RUN /host/07-bcm2835.sh

RUN mkdir -p /project

WORKDIR /project
