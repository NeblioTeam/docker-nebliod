FROM ubuntu:xenial
MAINTAINER Neblio <info@nebl.io>

COPY --from=neblioteam/nebliod-sync9:latest /bin/nebliod /bin/nebliod
COPY --from=neblioteam/nebliod-sync9:latest /root/.neblio.bootstrapped /root/.neblio.bootstrapped

RUN apt-get update && apt-get install -y wget git

ADD ./bin /usr/local/bin
RUN chmod 755 /usr/local/bin/neblio_quicksync

RUN cd $HOME \
    && /usr/local/bin/neblio_quicksync
