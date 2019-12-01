FROM neblioteam/buildpack-deps-rpi:latest
MAINTAINER Neblio <info@nebl.io>

ARG GITHUB_SHA=1

RUN [ "cross-build-start" ]

RUN cd $HOME \
    && export PATH=/usr/lib/ccache:$PATH \
    && if [ "$GITHUB_SHA" != 1 ]; then git clone -n https://github.com/NeblioTeam/neblio; fi \
    && if [ "$GITHUB_SHA" = 1 ]; then git clone -b master https://github.com/NeblioTeam/neblio; fi \
    && cd neblio \
    && if [ "$GITHUB_SHA" != 1 ]; then git checkout "${GITHUB_SHA}"; fi \
    && export OPENSSL_INCLUDE_PATH=$HOME/openssl_build/include/ \
    && export OPENSSL_LIB_PATH=$HOME/openssl_build/lib/ \
    && export PKG_CONFIG_PATH=$HOME/curl_build/lib/pkgconfig/ \
    && cd wallet \
    && ccache -s \
    && make "STATIC=1" -B -w -j2 -f makefile.unix \
    && ccache -s \
    && strip nebliod \
    && cp ./nebliod /bin/nebliod \
    && cd $HOME \
    && cd neblio \
    && ccache -s \
    && qmake "USE_UPNP=1" "USE_QRCODE=1" "RELEASE=1" "OPENSSL_INCLUDE_PATH=$HOME/openssl_build/include/" "OPENSSL_LIB_PATH=$HOME/openssl_build/lib/" "PKG_CONFIG_PATH=$HOME/curl_build/lib/pkgconfig/" "QRENCODE_INCLUDE_PATH=$HOME/qrencode_build/include/" "QRENCODE_LIB_PATH=$HOME/qrencode_build/lib/" neblio-wallet.pro \
    && make -B -w -j2 \
    && ccache -s \
    && cp ./wallet/neblio-qt /bin/neblio-qt \
    && ccache -s

RUN [ "cross-build-end" ]
