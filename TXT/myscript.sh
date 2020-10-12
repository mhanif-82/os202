#!/bin/bash

FILES="mylog.txt mypubkey.txt myrank.txt myscript.sh"
SHA="SHA256SUM"

rm -f $SHA $SHA.asc

echo "sha256sum $FILES > $SHA"
sha256sum $FILES > $SHA

echo "sha256sum -c $SHA"
sha256sum -c $SHA

echo "gpg -o $SHA.asc -a -sb $SHA"
gpg -o $SHA.asc -a -sb $SHA

echo "gpg --verify $SHA.asc $SHA"
gpg --verify $SHA.asc $SHA

git add .
git commit -m"OS202 mhanif-82"
git push origin master

exit 0
