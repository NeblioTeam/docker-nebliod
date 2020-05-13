FROM ubuntu:bionic
MAINTAINER Neblio <info@nebl.io>

RUN apt-get update && apt-get install --no-install-recommends --no-install-suggests -y ca-certificates

COPY --from=neblioteam/nebliod-build:latest /bin/nebliod /bin/nebliod
COPY --from=neblioteam/nebliod-sync-testnet:latest /root/.neblio.bootstrapped /root/.neblio.bootstrapped

RUN apt-get update && apt-get install -y wget

ADD ./bin /usr/local/bin
RUN chmod 755 /usr/local/bin/neblio_quicksync

RUN cd $HOME \
    && /usr/local/bin/neblio_quicksync
