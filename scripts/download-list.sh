#!/bin/bash
set -e
DIR="$(realpath $(dirname "$0"))"
cd "$DIR"/..
if [ -z "$1" ];
then
    echo scripts/download-list.sh PACKAGE-LIST-FILE
    exit 1
fi
mkdir -p download
cd download
cat ../$1 | xargs -L 1 -P 10 $DIR/download.sh
