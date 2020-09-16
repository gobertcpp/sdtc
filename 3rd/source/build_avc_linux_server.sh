#!/bin/bash

export CC=/opt/rh/devtoolset-2/root/usr/bin/gcc
export CXX=/opt/rh/devtoolset-2/root/usr/bin/g++
export LINK=/opt/rh/devtoolset-2/root/usr/bin/g++

set -e
BUILD_PATH="${PWD}/build"
INSTALL_PATH="${PWD}/../"

if [ -d ./install ]
then
echo "install dir already exist"
else
mkdir install
fi

echo "make googletest start!"
cd googletest 
mkdir -p build 
cd build 
rm -rf ./*
cmake .. -DCMAKE_INSTALL_PREFIX="${BUILD_PATH}"

make clean 
make
make install
# cp ${BUILD_PATH}/lib/libgtest.a ${INSTALL_PATH}
# strip --strip-unneeded ${INSTALL_PATH}/libgtest.a
echo ""
echo "make googletest done!"
echo ""

cd ../../

echo "make googletest done!"

echo "make nasm start!"
cd nasm-2.13.01
./configure \
     --disable-debug \
     CFLAGS="-fvisibility=hidden" \
     CXXFLAGS="-fvisibility=hidden" \
     --prefix="${BUILD_PATH}"

make clean
make -j8
make install
# cp libnasm.a ${INSTALL_PATH}
# strip --strip-unneeded ${INSTALL_PATH}/libnasm.a
echo ""
echo "make nasm done!"
echo ""

cd ../

echo "make libx264 start!"
cd x264
CFLAGS="-DWEBRTC_LINUX"

./configure \
--prefix=${BUILD_PATH} \
--disable-cli \
--enable-static \
--enable-pic \
--disable-opencl --enable-pic --extra-cflags="$CFLAGS" CFLAGS="-fvisibility=hidden" CXXFLAGS="-fvisibility=hidden"

echo ""
echo "configure x264 done!"
echo ""

make clean
make -j8
make install
# cp ${PWD}/../build/lib/libx264.a ${INSTALL_PATH}
# strip --strip-unneeded ${INSTALL_PATH}/libx264.a
echo ""
echo "make x264 done!"
echo ""

cd ../

echo "make libmp3lame start!"
cd lame-3.100
./configure \
--prefix=${BUILD_PATH} \
--with-pic \
--disable-shared  --enable-static --disable-frontend CFLAGS="-fvisibility=hidden" CXXFLAGS="-fvisibility=hidden" 


make clean
make -j8
make install
# cp ${PWD}/../build/lib/libmp3lame.a ${INSTALL_PATH}
# strip --strip-unneeded ${INSTALL_PATH}/libmp3lame.a
echo ""
echo "make libmp3lame done!"
echo ""

cd ../

echo "make libopus start!"
cd opus-1.3.1
./configure \
--prefix=${BUILD_PATH} \
--with-pic \
--disable-shared --enable-static \
CFLAGS="-fvisibility=hidden" \
CXXFLAGS="-fvisibility=hidden" 


make clean
make -j8
make install
# cp ${PWD}/../build/lib/libopus.a ${INSTALL_PATH}
# strip --strip-unneeded ${INSTALL_PATH}/libopus.a
echo ""
echo "make libopus done!"
echo ""

cd ../

echo "make autoconf-2.65 start"
cd autoconf-2.65
./configure --prefix="${BUILD_PATH}" CFLAGS="-fvisibility=hidden" CXXFLAGS="-fvisibility=hidden" 
make clean
make && make install 

echo "make autoconf-2.65 done!"

cd ../

echo "make libfdk-aac start!"
cd fdk-aac-2.0.1
./configure \
--prefix=${BUILD_PATH} \
--with-pic \
--disable-shared --enable-static \
CFLAGS="-fvisibility=hidden" \
CXXFLAGS="-fvisibility=hidden" 

make clean
make -j8
make install
# cp ${PWD}/../build/lib/libfdk-aac.a ${INSTALL_PATH}
# strip --strip-unneeded ${INSTALL_PATH}/libfdk-aac.a
echo ""
echo "make libfdk-aac done!"
echo ""


cd ../

echo "make libyuv start!"
cd libyuv
rm -rf build 
mkdir build
cd build 
cmake .. -DTARGET_BUILD_DEBUG=FALSE -DCMAKE_INSTALL_PREFIX="${BUILD_PATH}"
make
# cp libyuv.a ${INSTALL_PATH}
#strip --strip-unneeded ${INSTALL_PATH}/libyuv.a
cd ../
echo ""
echo "make libyuv done!"
echo ""

cd ../

echo ""
echo "configure ffmpeg start!"
echo ""

cd ffmpeg
export PKG_CONFIG_PATH="${BUILD_PATH}/lib/pkgconfig":${PKG_CONFIG_PATH}
./configure \
--libdir=${BUILD_PATH}/lib \
--incdir=${BUILD_PATH}/include \
--extra-cflags="-I${BUILD_PATH}/include -I./build/include -I../x264 -fvisibility=hidden" \
--extra-cxxflags="-fvisibility=hidden" \
--extra-ldflags="-L${BUILD_PATH}/lib -L./build/lib -L../x264" \
--extra-cxxflags="-fPIC" \
--enable-libx264 \
--enable-libmp3lame \
--enable-libfdk-aac \
--enable-libopus \
--enable-nonfree \
--enable-gpl \
--pkg-config-flags="--static" \
--disable-doc \
--disable-zlib \
--disable-bzlib \
--disable-programs \
--disable-avdevice \
--disable-postproc \
--disable-shared \
--disable-iconv \
--enable-pic \
--disable-debug 

make clean
make -j8
make install
make clean

echo "make ffmpeg done!"
echo ""


#strip --strip-unneeded ${BUILD_PATH}/libavcodec.a
#strip --strip-unneeded ${BUILD_PATH}/libavfilter.a
#strip --strip-unneeded ${BUILD_PATH}/libavformat.a
#strip --strip-unneeded ${BUILD_PATH}/libavutil.a
#strip --strip-unneeded ${BUILD_PATH}/libswresample.a
#strip --strip-unneeded ${BUILD_PATH}/libswscale.a

cp ${BUILD_PATH}/lib/*.a ${INSTALL_PATH}/libs/
cp ${BUILD_PATH}/lib64/*.a ${INSTALL_PATH}/libs/
cp ${BUILD_PATH}/include/* ${INSTALL_PATH}/include

git clean -xfd

echo ""
echo "Generating the libavcodec done!"
exit
