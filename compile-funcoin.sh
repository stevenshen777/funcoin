#!/bin/bash
export PATH=/home/btc/mxe/usr/bin:$PATH
make clean
cd src
make clean
cd leveldb
make clean

TARGET_OS=NATIVE_WINDOWS make libleveldb.a libmemenv.a CC=/home/btc/mxe/usr/bin/i686-w64-mingw32.static-gcc CXX=/home/btc/mxe/usr/bin/i686-w64-mingw32.static-g++
cd ../..


MXE_INCLUDE_PATH=/home/btc/mxe/usr/i686-w64-mingw32.static/include
MXE_LIB_PATH=/home/btc/mxe/usr/i686-w64-mingw32.static/lib
i686-w64-mingw32.static-qmake-qt5 \
 BOOST_LIB_SUFFIX=-mt \
 BOOST_THREAD_LIB_SUFFIX=_win32-mt \
 BOOST_INCLUDE_PATH=$MXE_INCLUDE_PATH/boost \
 BOOST_LIB_PATH=$MXE_LIB_PATH \
 OPENSSL_INCLUDE_PATH=$MXE_INCLUDE_PATH/openssl \
 OPENSSL_LIB_PATH=$MXE_LIB_PATH \
 BDB_INCLUDE_PATH=$MXE_INCLUDE_PATH \
 BDB_LIB_PATH=$MXE_LIB_PATH \
 MINIUPNPC_INCLUDE_PATH=$MXE_INCLUDE_PATH \
 MINIUPNPC_LIB_PATH=$MXE_LIB_PATH \
 QRENCODE_INCLUDE_PATH=$MXE_INCLUDE_PATH \
     QRENCODE_LIB_PATH=$MXE_LIB_PATH \
 QMAKE_LRELEASE=/home/btc/mxe/usr/i686-w64-mingw32.static/qt5/bin/lrelease /home/btc/funcoin/bitcoin-qt.pro
make -f Makefile.Release -j2
