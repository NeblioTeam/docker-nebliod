FROM neblioteam/buildpack-deps-rpi:nebliod
MAINTAINER Neblio <info@nebl.io>


ENTRYPOINT cd $HOME \
    && export PATH=/usr/lib/ccache:$PATH \
    && export CCACHE_DIR=/root/vol/deploy/.ccache \
    && export CCACHE_MAXSIZE=1G \
    && cd /root/vol \
    && export OPENSSL_INCLUDE_PATH=$HOME/openssl_build/include/ \
    && export OPENSSL_LIB_PATH=$HOME/openssl_build/lib/ \
    && export PKG_CONFIG_PATH=$HOME/curl_build/lib/pkgconfig/ \
    && ccache -s \
    && if [ "$BUILD" = "nebliod" ]; then cd /root/vol/wallet; fi \
    && if [ "$BUILD" = "nebliod" ]; then make "lmdb32=1" "STATIC=1" -B -w -j2 -f makefile.unix; fi \
    && if [ "$BUILD" = "nebliod" ]; then strip nebliod; fi \
    && if [ "$BUILD" = "nebliod" ]; then cp ./nebliod /root/vol/deploy/nebliod; fi \
    && if [ "$BUILD" = "neblio-qt" ]; then cd /root/vol; fi \
    && if [ "$BUILD" = "neblio-qt" ]; then qmake "USE_UPNP=1" "USE_QRCODE=1" "RELEASE=1" "OPENSSL_INCLUDE_PATH=$HOME/openssl_build/include/" "OPENSSL_LIB_PATH=$HOME/openssl_build/lib/" "PKG_CONFIG_PATH=$HOME/curl_build/lib/pkgconfig/" neblio-wallet.pro; fi \
    && if [ "$BUILD" = "neblio-qt" ]; then make -B -w -j2; fi \
    && if [ "$BUILD" = "neblio-qt" ]; then cp ./wallet/neblio-qt /root/vol/deploy/neblio-qt; fi \
    && ccache -s
