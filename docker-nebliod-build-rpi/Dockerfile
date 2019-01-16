FROM neblioteam/buildpack-deps-rpi:latest
MAINTAINER Neblio <info@nebl.io>

RUN [ "cross-build-start" ]

RUN cd $HOME \
    && export PATH=/usr/lib/ccache:$PATH \
    && git clone -b master https://github.com/NeblioTeam/neblio \
    && export OPENSSL_INCLUDE_PATH=$HOME/openssl_build/include/ \
    && export OPENSSL_LIB_PATH=$HOME/openssl_build/lib/ \
    && export PKG_CONFIG_PATH=$HOME/curl_build/lib/pkgconfig/ \
    && cd neblio/wallet \
    && ccache -s \
    && make "STATIC=1" -B -w -j2 -f makefile.unix \
    && ccache -s \
    && strip nebliod \
    && cp ./nebliod /bin/nebliod \
    && cd $HOME \
    && cd neblio \
    && ccache -s \
    && qmake "USE_UPNP=1" "USE_QRCODE=1" "RELEASE=1" "OPENSSL_INCLUDE_PATH=$HOME/openssl_build/include/" "OPENSSL_LIB_PATH=$HOME/openssl_build/lib/" "PKG_CONFIG_PATH=$HOME/curl_build/lib/pkgconfig/" neblio-wallet.pro \
    && make -B -w -j2 \
    && ccache -s \
    && cp ./wallet/neblio-qt /bin/neblio-qt \
    && ccache -s

RUN [ "cross-build-end" ]
