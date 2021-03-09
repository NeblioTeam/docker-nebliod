FROM neblioteam/buildpack-deps-rpi:latest
MAINTAINER Neblio <info@nebl.io>

ARG GITHUB_SHA=1

RUN [ "cross-build-start" ]

RUN cd $HOME \
    && export PATH=/usr/lib/ccache:$PATH \
    && if [ "$GITHUB_SHA" != 1 ]; then git clone -n https://github.com/NeblioTeam/neblio; fi \
    && if [ "$GITHUB_SHA" = 1 ]; then git clone -b master https://github.com/NeblioTeam/neblio; fi \
    && if [ "$GITHUB_SHA" != 1 ]; then cd neblio && git checkout "${GITHUB_SHA}" && cd ..; fi \
    && export OPENSSL_INCLUDE_PATH=$HOME/openssl_build/include/ \
    && export OPENSSL_LIB_PATH=$HOME/openssl_build/lib/ \
    && export PKG_CONFIG_PATH=$HOME/curl_build/lib/pkgconfig/ \
    && export BOOST_INCLUDE_PATH="$(pwd)/boost_build/include/" \
    && export BOOST_LIB_PATH="$(pwd)/boost_build/lib/" \
    && cd neblio/wallet \
    && ccache -s \
    && make "STATIC=1" -B -w -j2 -f makefile.unix \
    && ccache -s \
    && strip nebliod \
    && cp ./nebliod /bin/nebliod \
    && ccache -s

RUN [ "cross-build-end" ]
