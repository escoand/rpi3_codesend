#!/bin/sh
DIR=$(dirname $0)
LD_LIBRARY_PATH=$DIR
$DIR/codesend "$@"