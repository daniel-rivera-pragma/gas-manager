#!/bin/bash
function map_libraries() {
  local root_dir="${1}" && shift
  local lib_name
  local lib_file
  local lib_path
  local map=""
  for lib_name in "${@}"; do
    [ -z "${lib_name}" ] && echo "ERR~ Unexpected empty lib name" >&2 && return 1
    lib_file="${lib_name}.js"
    lib_path="${root_dir}/templates/.lib/${lib_file}.sample"
    [ ! -f "${lib_path}" ] && echo "ERR~ ${lib_name} library not found" >&2 && return 1
    map="${map} ${lib_file}:${lib_path}:./src/.lib/${lib_file}"
  done
  echo "${map}"
}
