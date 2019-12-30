FROM neblioteam/buildpack-deps:latest
MAINTAINER Neblio <info@nebl.io>


ENTRYPOINT cd $HOME \
    && export PATH=/usr/lib/ccache:$PATH \
    && export CCACHE_DIR=/root/vol/deploy/.ccache \
    && export CCACHE_COMPRESS=1 \
	&& export CCACHE_COMPRESSLEVEL=9 \
	&& export CCACHE_MAXSIZE=150M \
    && cd /root/vol \
    && export OPENSSL_INCLUDE_PATH=$HOME/openssl_build/include/ \
    && export OPENSSL_LIB_PATH=$HOME/openssl_build/lib/ \
    && export PKG_CONFIG_PATH=$HOME/curl_build/lib/pkgconfig/ \
    && export BOOST_INCLUDE_PATH="$(pwd)/boost_build/include/" \
    && export BOOST_LIB_PATH="$(pwd)/boost_build/lib/" \
    && ccache -s \
    && if [ "$BUILD" = "nebliod" ]; then cd /root/vol/wallet; fi \
    && if [ "$BUILD" = "nebliod" ]; then make "STATIC=1" -B -w -j2 -f makefile.unix; fi \
    && if [ "$BUILD" = "nebliod" ]; then strip nebliod; fi \
    && if [ "$BUILD" = "nebliod" ]; then cp ./nebliod /root/vol/deploy/nebliod; fi \
    && if [ "$BUILD" = "neblio-qt" ]; then cd /root/vol; fi \
    && if [ "$BUILD" = "neblio-qt" ]; then qmake "USE_UPNP=1" "USE_QRCODE=1" "RELEASE=1" "OPENSSL_INCLUDE_PATH=$HOME/openssl_build/include/" "OPENSSL_LIB_PATH=$HOME/openssl_build/lib/" "PKG_CONFIG_PATH=$HOME/curl_build/lib/pkgconfig/" "QRENCODE_INCLUDE_PATH=$HOME/qrencode_build/include/" "QRENCODE_LIB_PATH=$HOME/qrencode_build/lib/" "BOOST_INCLUDE_PATH=$(pwd)/boost_build/include/" "BOOST_LIB_PATH=$(pwd)/boost_build/lib/" neblio-wallet.pro; fi \
    && if [ "$BUILD" = "neblio-qt" ]; then make -B -w -j2; fi \
    && if [ "$BUILD" = "neblio-qt" ]; then cp ./wallet/neblio-qt /root/vol/deploy/neblio-qt; fi \
    && if [ "$BUILD" = "tests-neblio-qt" ]; then cd /root/vol; fi \
    && if [ "$BUILD" = "tests-neblio-qt" ]; then qmake "USE_UPNP=1" "USE_QRCODE=1" "RELEASE=1" "OPENSSL_INCLUDE_PATH=$HOME/openssl_build/include/" "OPENSSL_LIB_PATH=$HOME/openssl_build/lib/" "PKG_CONFIG_PATH=$HOME/curl_build/lib/pkgconfig/" "QRENCODE_INCLUDE_PATH=$HOME/qrencode_build/include/" "QRENCODE_LIB_PATH=$HOME/qrencode_build/lib/" "BOOST_INCLUDE_PATH=$(pwd)/boost_build/include/" "BOOST_LIB_PATH=$(pwd)/boost_build/lib/" "DEFINES += UNITTEST_RUN_NTP_PARSE_TESTS" "NEBLIO_CONFIG += NoWallet" neblio-wallet.pro; fi \
    && if [ "$BUILD" = "tests-neblio-qt" ]; then make -B -w -j2; fi \
    && if [ "$BUILD" = "tests-neblio-qt" ]; then touch ./wallet/neblio-qt.running-tests; fi \
    && if [ "$BUILD" = "tests-neblio-qt" ]; then ./wallet/test/neblio-tests; fi \
    && if [ "$BUILD" = "tests-neblio-qt" ]; then cp ./wallet/neblio-qt.running-tests /root/vol/deploy/tests-neblio-qt; fi \
    && ccache -s
