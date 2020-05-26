#!/bin/bash
set -x

chown -R root:root .
chown root:root $PWD
chmod a+w .
chmod a+w $PWD

touch /github/workspace/Gemfile.lock
chown root:root /github/workspace/Gemfile.lock
chmod a+w /github/workspace/Gemfile.lock

echo "#################################################"
echo "### Starting the Jekyll Action"
pwd
ls -l
bundle install
ls

echo "#################################################"
echo "### Installion completed"

if [[ -z "${SRC}" ]]; then
  SRC=$(find . -name _config.yml -exec dirname {} \;)
fi

echo "#################################################"
echo "### Source for the Jekyll site is set to ${SRC}"

git status
git remote -v

bundle exec jekyll build -s ${SRC} -d build
echo "#################################################"
echo "### Jekyll build done"

cd build

ls -l
