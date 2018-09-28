FROM neblioteam/nebliod-build-rpi
#FROM neblioteam/nebliod-sync-rpi
MAINTAINER Neblio <info@nebl.io>

RUN [ "cross-build-start" ]

ADD ./bin /usr/local/bin
RUN chmod 755 /usr/local/bin/neblio_quicksync

RUN cd $HOME \
    && /usr/local/bin/neblio_quicksync

RUN [ "cross-build-end" ]
