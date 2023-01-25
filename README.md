# opam-downloader

```sh
git submodule init --update
./scripts/prepare-list.sh

# download all packages in package-list.txt. it will create 'download' directory
./scripts/download-list.sh ./package-list.txt

# extract all files in download/NAME/*.*
# will create 'extract' directory
./scripts/extract.sh
```
