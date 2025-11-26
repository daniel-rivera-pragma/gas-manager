#!/bin/bash
set -euo pipefail
# bootstrap
declare root_dir="${1}" && shift
echo "INF~ list command started" >&2
# list-env-files
[ ! -d ./.gasm ] && echo "INF~ No envs found" >&2 && exit 0
declare envs=$(ls ./.gasm)
[ -z "${envs}" ] && echo "INF~ No envs found" >&2 && exit 0
echo "INF~ Current available envs" >&2
for env_name in ${envs}; do
  echo "     - $(echo "${env_name}" | sed -e "s/clasp-//" -e "s/\.json//")" >&2
done
exit 0
