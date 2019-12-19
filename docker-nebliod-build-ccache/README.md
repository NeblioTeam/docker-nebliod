Mount a volume to hold the .ccache folder and run with something like the following:

sudo docker run -v $PWD/deploy:/root/deploy -e BRANCH=NTP1Support-lmdb -t neblioteam/nebliod-build-ccache

Package the ccache folder and upload to S3

tar -zcf rpi-build-ccache-NTP1Support-lmdb.tar.gz -C ./deploy .ccache