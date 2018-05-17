FROM neblioteam/buildpack-deps:nebliod
MAINTAINER Neblio <info@nebl.io>

RUN cd $HOME \
    && git clone https://github.com/NeblioTeam/neblio \
    && cd neblio/wallet \
    && mkdir obj \
    && cd obj \
    && mkdir zerocoin \
    && cd .. \
    && cd leveldb \
    && chmod 755 * \
    && cd .. \
    && make -B -w -f makefile.unix \
    && strip nebliod \
    && cp ./nebliod /bin/nebliod \
    && rm -r $HOME/neblio
