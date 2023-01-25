#!/bin/bash
set -e
DIR="$(realpath $(dirname "$0"))"
if [ -z "$1" ]
then
    echo scripts/download.sh PACKAGE
    exit 1
fi

URL=$(opam show $1 | sed -En 's!^url\.src[[:space:]]*"(.*)"$!\1!p')

if [ -z "$URL" ]
then
    echo "Package $1 not found"
    exit 1
fi

FILE=$(basename "$URL")
echo Downloading $1

mkdir -p "$1"
cd "$1"
wget -q -O "$FILE" "$URL" || (cd ..; rm -rf "$1"; exit 1)
