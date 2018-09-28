FROM neblioteam/buildpack-deps-rpi:nebliod
MAINTAINER Neblio <info@nebl.io>

RUN [ "cross-build-start" ]

RUN cd $HOME \
    && git clone -b v1.5.2-temp-branch https://github.com/NeblioTeam/neblio \
    && cd neblio/wallet \
    && mkdir obj \
    && cd obj \
    && mkdir zerocoin \
    && cd .. \
    && cd leveldb \
    && chmod 755 * \
    && cd .. \
    && make "STATIC=1" -B -w -f makefile.unix \
    && strip nebliod \
    && cp ./nebliod /bin/nebliod \
    && rm -r $HOME/neblio

RUN [ "cross-build-end" ]
