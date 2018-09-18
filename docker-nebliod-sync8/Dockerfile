FROM neblioteam/nebliod-sync7
MAINTAINER Neblio <info@nebl.io>

ADD ./bin /usr/local/bin
RUN chmod 755 /usr/local/bin/neblio_quicksync

RUN cd $HOME \
    && /usr/local/bin/neblio_quicksync
