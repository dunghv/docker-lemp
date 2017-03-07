FROM debian:jessie

MAINTAINER Hoang Viet Dzung <dung.hvd@gmail.com>

ENV DEBEMAIL="dung.hvd@gmail.com"
ENV DEBFULLNAME="Hoang Viet Dzung"

RUN apt-get update \
    && apt-get install -y build-essential \
    && rm -rf /var/lib/apt/lists/* \
    && mkdir /source

WORKDIR /source

VOLUME ["/source"]

cmd ["dh_make"]
