#!/bin/bash
set -euo pipefail
# Load functions
declare root_dir="${1}" && shift
[ ! -f "${root_dir}/functions/load-functions.sh" ] && echo "ERR~ Functions loader not found" >&2 && exit 1
source "${root_dir}/functions/load-functions.sh"
load_functions "${root_dir}" "copy-element" "create-folder"
# Initialize
echo "INF~ add:lib command started" >&2
[ ! -f ./.clasp.json ] && echo "ERR~ No .clasp.json file found" >&2 && exit 1
# Scafold lib directories
[ ! -d ./src ] && echo "ERR~ No src folder found" >&2 && exit 1
echo "INF~ Scafolding directories" >&2
create_folder "Lib:./src/lib"
# Copy lib files
echo "INF~ Copying JS files" >&2
declare dependency_manager_js="dependency-manager.js:${root_dir}/templates/lib/dependency-manager.js.sample:./src/lib/dependency-manager.js"
declare cache_manager_js="cache-manager.js:${root_dir}/templates/lib/cache-manager.js.sample:./src/lib/cache-manager.js"
declare spreadsheets_manager_js="spreadsheets-manager.js:${root_dir}/templates/lib/spreadsheets-manager.js.sample:./src/lib/spreadsheets-manager.js"
copy_element "${dependency_manager_js}" "${cache_manager_js}" "${spreadsheets_manager_js}"
# Copy type files
[ ! -d ./types ] && echo "ERR~ No types folder found" >&2 && exit 1
echo "INF~ Copying type definition files" >&2
declare types_lib="lib.d.ts:${root_dir}/templates/types/lib.d.ts.sample:./types/lib.d.ts"
copy_element "${types_lib}"
# End message
echo "INF~ Lib added correctly to project" >&2
