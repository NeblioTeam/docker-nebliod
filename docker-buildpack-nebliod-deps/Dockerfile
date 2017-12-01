FROM buildpack-deps:xenial
MAINTAINER Neblio <info@nebl.io>

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        libboost-all-dev \
        libdb++-dev \
        libminiupnpc-dev \
        libssl-dev \
    && rm -rf /var/lib/apt/lists/*