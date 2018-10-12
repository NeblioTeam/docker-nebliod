FROM neblioteam/buildpack-deps-rpi:nebliod
MAINTAINER Neblio <info@nebl.io>

ENTRYPOINT cross-build-start \
    && cd $HOME \
    && export PATH=/usr/lib/ccache:$PATH \
    && export CCACHE_DIR=/root/deploy/.ccache \
    && git clone -b $BRANCH https://github.com/NeblioTeam/neblio \
    && cd neblio/wallet \
    && mkdir obj \
    && cd obj \
    && mkdir zerocoin \
    && cd .. \
    && cd leveldb \
    && chmod 755 * \
    && cd .. \
    && ccache -s \
    && make "STATIC=1" -B -w -j2 -f makefile.unix \
    && ccache -s \
    && strip nebliod \
    && cp ./nebliod /root/deploy/nebliod \
    && cd $HOME \
    && cd neblio \
    && qmake "USE_UPNP=1" "USE_QRCODE=0" "RELEASE=1" neblio-wallet.pro \
    && make -B -w -j2 \
    && ccache -s \
    && cp ./wallet/neblio-qt /root/deploy/neblio-qt \
    && cross-build-end
