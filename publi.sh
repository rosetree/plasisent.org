#!/usr/bin/env bash

git push origin master
cd ../plasisent.org-clean/

# please,
git pull origin master # and now
make # style build # my blog.

cd output
git add .
git commit -m "publi.sh"
git push public master
