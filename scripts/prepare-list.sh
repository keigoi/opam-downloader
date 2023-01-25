#!/bin/bash
set -e
DIR="$(realpath $(dirname "$0"))"
cd "$DIR"/..

echo 'updating package-list.txt ...'
pushd opam-repository/packages >/dev/null
ls > ../../package-list.txt
popd >/dev/null

