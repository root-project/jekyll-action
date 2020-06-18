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

# PRs have baseurl '<prnumber>/'
BASEURL_OPT="${PR_NUMBER:+--baseurl=${PR_NUMBER}/}"
bundle exec jekyll build ${BASEURL_OPT:-} --destination build/${PR_NUMBER:-}

echo "#################################################"
echo "### Jekyll build done"
