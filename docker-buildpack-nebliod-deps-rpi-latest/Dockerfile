FROM balenalib/raspberry-pi-debian:bullseye
MAINTAINER Neblio <info@nebl.io>

RUN [ "cross-build-start" ]

RUN apt-get update && apt-get install -y --no-install-recommends \
        sudo \
        build-essential \
        libcurl4-openssl-dev \
        libdb++-dev \
        libminiupnpc-dev \
        qtbase5-dev \
        qt5-qmake \
        qtbase5-dev-tools \
        qttools5-dev-tools \
        libqrencode-dev \
        libldap2-dev \
        libidn11-dev \
        librtmp-dev \
        libsodium-dev \
        ccache \
        git \
        python-setuptools \
        ca-certificates \
        python3-pip \
        libboost-tools-dev \
    && rm -rf /var/lib/apt/lists/*

RUN cd $HOME \
    && pip install requests \
    && git clone -b master https://github.com/NeblioTeam/neblio \
    && python3 neblio/build_scripts/CompileOpenSSL-Linux.py \
    && python3 neblio/build_scripts/CompileCurl-Linux.py \
    && python3 neblio/build_scripts/CompileQREncode-Linux.py \
    && python3 neblio/build_scripts/CompileBoost-Linux.py \
    && cd $HOME \
    && rm -rf neblio

RUN [ "cross-build-end" ]
