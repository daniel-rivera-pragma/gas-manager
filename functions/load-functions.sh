#!/bin/bash
function load_functions() {
  local root_dir="${1}" && shift
  local element
  for element in "${@}"; do
    [ ! -f "${root_dir}/functions/${element}.sh" ] && echo "ERR~ Function ${element} not found" >&2 && exit 1
    source "${root_dir}/functions/${element}.sh"
  done
}
