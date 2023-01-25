#!/bin/bash
set -e
SCRIPT_DIR="$(realpath $(dirname "$0"))"
DOWNLOAD_DIR=$SCRIPT_DIR/../download
EXTRACT_DIR=$SCRIPT_DIR/../extract

mkdir -p $EXTRACT_DIR

PACKAGES=$(cd $DOWNLOAD_DIR; ls)
for NAME in $PACKAGES; do
  echo $NAME
  PACKAGE_DIR=$DOWNLOAD_DIR/$NAME
  FILES=$(cd $PACKAGE_DIR; ls *.* 2>/dev/null || echo 'NONE')
  if [ "$FILES" == "NONE" ]; then continue; fi
  for FILE in $FILES; do
    FILEPATH=$(realpath $PACKAGE_DIR/$FILE)
    mkdir -p $EXTRACT_DIR/$NAME
    cd $EXTRACT_DIR/$NAME
    case $FILE in
    *.tar.gz)
      tar xf $FILEPATH || (echo "failed at $FILEPATH" | tee failed.txt)
      ;;
    *.tgz)
      tar xf $FILEPATH || (echo "failed at $FILEPATH" | tee failed.txt)
      ;;
    *.tbz)
      tar xf $FILEPATH || (echo "failed at $FILEPATH" | tee failed.txt)
      ;;
    *.tar.bz2)
      tar xf $FILEPATH || (echo "failed at $FILEPATH" | tee failed.txt)
      ;;
    *.tar.xz)
      tar xf $FILEPATH || (echo "failed at $FILEPATH" | tee failed.txt)
      ;;
    *.zip)
      unzip -qf $FILEPATH || (echo "failed at $FILEPATH" | tee failed.txt)
      ;;
    *)
      echo mv $NAME/$FILE has type $(file $FILE) | tee failed.txt
    esac
  done
done
