#!/bin/bash
set -e

pwd

chown -R root:root .
chown root:root $PWD
chmod a+w .
chmod a+w $PWD

ls -l
ls -ld

touch /github/workspace/Gemfile.lock
chown root:root /github/workspace/Gemfile.lock
chmod a+w /github/workspace/Gemfile.lock

ls -l
ls -ld

echo "#################################################"
echo "Starting the Jekyll Action"

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
