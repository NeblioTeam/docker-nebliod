FROM resin/raspberry-pi2-buildpack-deps:stretch
MAINTAINER Neblio <info@nebl.io>

RUN [ "cross-build-start" ]

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        libboost-all-dev \
        libdb++-dev \
        libminiupnpc-dev \
        libssl-dev \
    && rm -rf /var/lib/apt/lists/*

RUN [ "cross-build-end" ]