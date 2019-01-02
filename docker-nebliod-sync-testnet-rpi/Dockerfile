FROM resin/armv7hf-debian:stretch
MAINTAINER Neblio <info@nebl.io>

RUN [ "cross-build-start" ]

COPY --from=neblioteam/nebliod-build-testnet-rpi:latest /bin/nebliod /bin/nebliod
COPY --from=neblioteam/nebliod-sync-testnet-rpi:latest /root/.neblio.bootstrapped /root/.neblio.bootstrapped

RUN apt-get update && apt-get install -y wget

ADD ./bin /usr/local/bin
RUN chmod 755 /usr/local/bin/neblio_quicksync

RUN cd $HOME \
    && /usr/local/bin/neblio_quicksync

RUN [ "cross-build-end" ]
