FROM neblioteam/buildpack-deps:latest
MAINTAINER Neblio <info@nebl.io>

ARG GITHUB_SHA=1

RUN cd $HOME \
    && if [ "$GITHUB_SHA" != 1 ]; then git clone -n https://github.com/NeblioTeam/neblio; fi \
    && if [ "$GITHUB_SHA" = 1 ]; then git clone -b master https://github.com/NeblioTeam/neblio; fi \
    && if [ "$GITHUB_SHA" != 1 ]; then cd neblio && git checkout "${GITHUB_SHA}" && cd ..; fi \
    && PKG_CONFIG_PATH="$(pwd)/curl_build/lib/pkgconfig/" \
    && OPENSSL_INCLUDE_PATH="$(pwd)/openssl_build/include/" \
    && OPENSSL_LIB_PATH="$(pwd)/openssl_build/lib/" \
    && BOOST_INCLUDE_PATH="$(pwd)/boost_build/include/" \
    && BOOST_LIB_PATH="$(pwd)/boost_build/lib/" \
    && export PKG_CONFIG_PATH \
    && export OPENSSL_INCLUDE_PATH \
    && export OPENSSL_LIB_PATH \
    && export BOOST_INCLUDE_PATH \
    && export BOOST_LIB_PATH \
    && cd neblio/wallet \
    && make "STATIC=1" -B -w -f makefile.unix -j2 \
    && strip nebliod \
    && cp ./nebliod /bin/nebliod \
    && rm -r $HOME/neblio
