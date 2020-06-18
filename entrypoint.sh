#!/bin/bash
set -euo pipefail
IFS=$'\n\t'
set -x

chown -R root:root .
chmod a+w .

touch /github/workspace/Gemfile.lock
chown root:root /github/workspace/Gemfile.lock
chmod a+w /github/workspace/Gemfile.lock

echo "#################################################"
echo "### Starting the Jekyll Action"
set +e
bundle install # returns non-zero for some reason
set -e

echo "#################################################"
echo "### Installation completed"

bundle exec jekyll build -d build

echo "#################################################"
echo "### Jekyll build done"
