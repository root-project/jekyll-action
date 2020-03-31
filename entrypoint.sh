#!/bin/bash
set -e

echo "#################################################"
echo "Starting the Jekyll Action"

ls -l .

whoami

bundle install
echo "#################################################"
echo "Installion completed"

if [[ -z "${SRC}" ]]; then
  SRC=$(find . -name _config.yml -exec dirname {} \;)
fi

echo "#################################################"
echo "Source for the Jekyll site is set to ${SRC}"

bundle exec jekyll build -s ${SRC} -d build
echo "#################################################"
echo "Jekyll build done"

cd build

ls -l
