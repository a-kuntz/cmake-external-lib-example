#!/bin/bash

set -x
set -e

make -C foo
cmake -Bbuild -H.
# cmake -Bbuild -H. --debug-output
make -C build
./build/main