#!/bin/bash
set -euo pipefail
# bootstrap
declare root_dir="${1}" && shift
[ ${#} -le 1 ] && echo "ERR~ No enough parameters received" >&2 && exit 1
# validate-tools
[ ! -f ./node_modules/.bin/clasp ] && echo "ERR~ No available clasp command found" >&2 && exit 1
[ ! -f ./node_modules/.bin/prettier ] && echo "ERR~ No available prettier command found" >&2 && exit 1
# get-variables
declare env_name="${1}"
[ -z "$(echo "${env_name}" | grep -E "^[[:alpha:][:digit:][:space:]-]+$")" ] && echo "ERR~ App name can only contain letters, numbers and spaces" >&2 && exit 1
env_name=$(echo "${env_name}" | tr "[:upper:]" "[:lower:]" | sed -E -e "s/^[[:space:]-]*//" -e "s/[[:space:]-]*$//" -e "s/[[:space:]-]+/-/g")
declare env_id="${2}"
echo "INF~ env:add command started" >&2
echo -e "     - Env name: ${env_name}" >&2
echo -e "     - Env id: ${env_id}" >&2
# check-if-first-env
if [ -f ./.clasp.json ]; then
  rm -f ./.clasp.json
  [ -d ./src ] && mv ./src ./tmp
else
  [ -d ./src ] && rm -rf ./src
fi
npx clasp clone --rootDir src "${env_id}"
[ ! -d ./.gasm ] && mkdir ./.gasm
cp ./.clasp.json ".gasm/clasp-${env_name}.json"
npx prettier --write "./.gasm/clasp-${env_name}.json"
if [ -d ./tmp ]; then
  [ -d ./src ] && rm -rf ./src
  mv ./tmp ./src
fi
# end-command
echo "INF~ Env '${env_name}' was added" >&2
exit 0
