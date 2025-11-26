#!/bin/bash
set -euo pipefail
# bootstrap
declare root_dir="${1}" && shift
[ ${#} -le 0 ] && echo "ERR~ No enough parameters received" >&2 && exit 1
# get-variables
declare env_name="${1}"
echo "INF~ push command started" >&2
echo "     - Env name: ${env_name}" >&2
# check-and-switch-env
[ ! -f "./.gasm/clasp-${env_name}.json" ] && echo "ERR~ env with name ${env_name} not found" >&2 && exit 1
cp "./.gasm/clasp-${env_name}.json" ./.clasp.json
# execute-push-command
npm run push
echo "INF~ code pushed on env ${env_name}" >&2
exit 0
