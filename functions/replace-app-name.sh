#!/bin/bash
function replace_app_name() {
  local app_root="${1}" && shift
  local app_name="${1}" && shift
  local element
  for element in "${@}"; do
    echo -e "     - ${element}\c" >&2
    sed -i -e "s/%APP_NAME%/${app_name}/g" "${app_root}/${element}" && echo " [OK]" >&2
  done
}
