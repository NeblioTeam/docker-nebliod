FROM resin/raspberry-pi2-buildpack-deps:stretch
MAINTAINER Neblio <info@nebl.io>

RUN [ "cross-build-start" ]

RUN apt-get update && apt-get install -y --no-install-recommends \
        build-essential \
        libboost-all-dev \
        libdb++-dev \
        libminiupnpc-dev \
        qt5-default \
        qt5-qmake \
        qtbase5-dev-tools \
        qttools5-dev-tools \
        libqrencode-dev \
        libldap2-dev \
        libidn11-dev \
        librtmp-dev \
        ccache \
    && rm -rf /var/lib/apt/lists/*

RUN [ "cross-build-end" ]
