FROM neblioteam/buildpack-deps:latest
MAINTAINER Neblio <info@nebl.io>

RUN cd $HOME \
    && git clone -b master https://github.com/NeblioTeam/neblio \
    && cd neblio \
    && python build_scripts/CompileOpenSSL-Linux.py \
    && python build_scripts/CompileCurl-Linux.py \
    && PKG_CONFIG_PATH="$(pwd)/curl_build/lib/pkgconfig/" \
    && OPENSSL_INCLUDE_PATH="$(pwd)/openssl_build/include/" \
    && OPENSSL_LIB_PATH="$(pwd)/openssl_build/lib/" \
    && export PKG_CONFIG_PATH \
    && export OPENSSL_INCLUDE_PATH \
    && export OPENSSL_LIB_PATH \
    && cd wallet \
    && make "STATIC=1" -B -w -f makefile.unix -j2 \
    && strip nebliod \
    && cp ./nebliod /bin/nebliod \
    && rm -r $HOME/neblio
