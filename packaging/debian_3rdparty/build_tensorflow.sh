#!/usr/bin/env bash
set -e
. ../build_config.sh

rm -rf tmp
mkdir tmp
cd tmp

echo "Building Tensorflow $TENSORFLOW_VERSION"

FILENAME=libtensorflow-cpu-linux-x86_64-$TENSORFLOW_VERSION.tar.gz
curl -SLO https://storage.googleapis.com/tensorflow/libtensorflow/${FILENAME}
tar -xf ${FILENAME}

sudo curl -s -o ./include/tensorflow/c/generate-pc.sh https://raw.githubusercontent.com/tensorflow/tensorflow/master/tensorflow/c/generate-pc.sh

sudo sh ./include/tensorflow/c/generate-pc.sh -p ${PREFIX} -v $TENSORFLOW_VERSION

# # Patch the pkg-config file to remove the dependency on libtensorflow_framework.so,
# # which is not required in monolithic builds.
sed -i 's/ -ltensorflow_framework//' tensorflow.pc

cp tensorflow.pc ${PREFIX}/lib/pkgconfig/
cp -R ./include/tensorflow  ${PREFIX}/include

cd ../
sudo rm -r tmp
