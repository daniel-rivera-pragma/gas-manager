#!/bin/bash
set -euo pipefail
# bootstrap
declare root_dir="${1}" && shift
[ ${#} -le 0 ] && echo "ERR~ No enough parameters received" >&2 && exit 1
# get-variables
declare env_name="${1}"
[ -z "${env_name}" ] && echo "ERR~ Unexpected empty env_name" >&2 && exit 1
echo "INF~ env:switch command started" >&2
echo -e "     - Env name: ${env_name}" >&2
# change-env
[ ! -f "./.gasm/clasp-${env_name}.json" ] && echo "ERR~ env with name ${env_name} not found" >&2 && exit 1
cp "./.gasm/clasp-${env_name}.json" ./.clasp.json
# mark-active-env
echo "${env_name}" >./.gasm_env
# end-command
echo "INF~ Env switched to '${env_name}'" >&2
exit 0
