#!/bin/bash
set -euo pipefail
# Load functions
declare root_dir="${1}" && shift
[ ! -f "${root_dir}/functions/load-functions.sh" ] && echo "ERR~ Functions loader not found" >&2 && exit 1
source "${root_dir}/functions/load-functions.sh"
load_functions "${root_dir}" "copy-element" "create-folder" "map-libraries"
# Initialize
echo "INF~ include command started" >&2
[ ! -f ./.clasp.json ] && echo "ERR~ No .clasp.json file found" >&2 && exit 1
# Map libraries
[ ${#} -eq 0 ] && echo "ERR~ No libraries specified to include" >&2 && exit 1
declare libraries=$(map_libraries "${root_dir}" "${@}")
[ -z "${libraries}" ] && echo "ERR~ Unexpected empty libraries map" >&2 && exit 1
# Scafold lib directories
[ ! -d ./src ] && echo "ERR~ No src folder found" >&2 && exit 1
if [ ! -d ./src/.lib ]; then
  echo "INF~ Scafolding directories" >&2
  create_folder "Lib:./src/.lib"
fi
# Copy lib files
echo "INF~ Copying JS files" >&2
declare lib_map=(${libraries})
copy_element "${lib_map[@]}"
# End message
echo "INF~ Lib added correctly to project" >&2
