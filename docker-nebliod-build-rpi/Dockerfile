FROM neblioteam/buildpack-deps-rpi:nebliod
MAINTAINER Neblio <info@nebl.io>

RUN [ "cross-build-start" ]

RUN cd $HOME \
    && export PATH=/usr/lib/ccache:$PATH \
    && git clone -b NTP1Support https://github.com/NeblioTeam/neblio \
    && python ./neblio/build_scripts/CompileOpenSSL-Linux.py \
    && export OPENSSL_INCLUDE_PATH=$HOME/openssl_build/include/ \
    && export OPENSSL_LIB_PATH=$HOME/openssl_build/lib/ \
    && python ./neblio/build_scripts/CompileCurl-Linux.py \
    && export PKG_CONFIG_PATH=$HOME/curl_build/lib/pkgconfig/ \
    && python ./neblio/build_scripts/CompileQREncode-Linux.py \
    && cd neblio/wallet \
    && mkdir obj \
    && cd obj \
    && mkdir zerocoin \
    && cd .. \
    && cd leveldb \
    && chmod 755 * \
    && cd .. \
    && ccache -s \
    && make "STATIC=1" -B -w -j4 -f makefile.unix \
    && ccache -s \
    && strip nebliod \
    && cp ./nebliod /bin/nebliod \
    && cd $HOME \
    && cd neblio \
    && ccache -s \
    && qmake "USE_UPNP=1" "USE_QRCODE=1" "RELEASE=1" neblio-wallet.pro \
    && make -B -w -j4 \
    && ccache -s \
    && cp ./wallet/neblio-qt /bin/neblio-qt \
    && ccache -s

RUN [ "cross-build-end" ]
