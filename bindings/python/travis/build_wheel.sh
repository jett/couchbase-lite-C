#!/bin/bash

# checkout dependencies
cd /io
# temp only
git checkout python-bindings-setup
git submodule update --init --recursive

# install build tools
yum install -y libicu-devel.x86_64 zlib-devel.x86_64
/opt/python/cp37-cp37m/bin/pip install cffi cmake

ln -s /opt/devtoolset-9 /opt/devtoolset-8

# build the Couchbase Lite C library
mkdir /io/build_cmake
cd /io/build_cmake
/opt/python/cp37-cp37m/bin/cmake .. -B .
make

# build the Python bindings library
cd /io/bindings/python/CouchbaseLite
/opt/python/cp37-cp37m/bin/python3 ../BuildPyCBL.py

export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/io/bindings/python/CouchbaseLite

cd ..
/opt/python/cp37-cp37m/bin/python3 setup.py bdist bdist_wheel
auditwheel repair dist/*.whl
