#!/bin/bash
set -x

chown -R root:root .
chmod a+w .

touch /github/workspace/Gemfile.lock
chown root:root /github/workspace/Gemfile.lock
chmod a+w /github/workspace/Gemfile.lock

echo "#################################################"
echo "### Starting the Jekyll Action"
bundle install

echo "#################################################"
echo "### Installion completed"

if [[ -z "${SRC}" ]]; then
  SRC=$(find . -name _config.yml -exec dirname {} \;)
fi

echo "#################################################"
echo "### Source for the Jekyll site is set to ${SRC}"

bundle exec jekyll build -s ${SRC} -d build

echo "#################################################"
echo "### Jekyll build done"
