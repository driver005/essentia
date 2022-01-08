#!/usr/bin/env bash
set -e
BASEDIR=$(dirname $0)
cd $BASEDIR/debian_3rdparty
sh ./build_eigen3.sh
sh ./build_fftw3.sh
sh ./build_lame.sh
sh ./build_ffmpeg.sh
sh ./build_libsamplerate.sh
sh ./build_zlib.sh
sh ./build_taglib.sh
sh ./build_yaml.sh
sh ./build_chromaprint.sh

#!/usr/bin/env bash
#https://docs.bazel.build/versions/main/install-ubuntu.html
#https://github.com/tensorflow/tensorflow/issues/20937
#https://www.codegrepper.com/code-examples/shell/install+qt4-qmake+ubuntu

./build_qt.sh

# sudo apt-get install build-essential libyaml-dev swig pkg-config libeigen3-dev

# sudo add-apt-repository ppa:rock-core/qt4
# sudo apt update
# sudo apt install qt4-default
# sudo apt install qt4-qmake

./build_gaia.sh
rm -rf mkspecs plugins translations

.${BASEDIR}/../src/3rdparty/tensorflow/setup_from_libtensorflow.sh
# ./build_tensorflow.sh

rm -rf bin share
