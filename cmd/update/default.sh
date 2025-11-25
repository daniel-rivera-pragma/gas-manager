#!/bin/bash
set -euo pipefail
# Load functions
declare root_dir="${1}" && shift
[ ! -f "${root_dir}/functions/load-functions.sh" ] && echo "ERR~ Functions loader not found" >&2 && exit 1
source "${root_dir}/functions/load-functions.sh"
load_functions "${root_dir}" "copy-element" "create-folder"
# Initialize
echo "INF~ update command started" >&2
declare app_root="."
# Scafold
echo "INF~ Scafolding directories" >&2
declare dir_app="App:${app_root}"
declare dir_vscode="VSCode:${app_root}/.vscode"
declare dir_src="Sources:${app_root}/src"
declare dir_tests="Tests:${app_root}/tests"
declare dir_docs="Documentation:${app_root}/docs"
declare dir_types="Types:${app_root}/types"
create_folder "${dir_app}" "${dir_vscode}" "${dir_src}" "${dir_tests}" "${dir_docs}" "${dir_types}"
# .vscode
echo "INF~ Copying VSCode files" >&2
declare vscode_settings="settings.json:${root_dir}/templates/vscode/settings.json.sample:${app_root}/.vscode/settings.json"
declare vscode_extensions="extensions.json:${root_dir}/templates/vscode/extensions.json.sample:${app_root}/.vscode/extensions.json"
declare vscode_gas_snippet="google-apps-script.code-snippets:${root_dir}/templates/vscode/google-apps-script.code-snippets.sample:${app_root}/.vscode/google-apps-script.code-snippets"
copy_element "${vscode_settings}" "${vscode_extensions}" "${vscode_gas_snippet}"
# docs
echo "INF~ Copying Documentation files" >&2
declare docs_arch="ARCHITECTURE.md:${root_dir}/templates/docs/ARCHITECTURE.md.sample:${app_root}/docs/ARCHITECTURE.md"
declare docs_deploy="DEPLOYMENT.md:${root_dir}/templates/docs/DEPLOYMENT.md.sample:${app_root}/docs/DEPLOYMENT.md"
declare docs_dev="DEVELOPMENT.md:${root_dir}/templates/docs/DEVELOPMENT.md.sample:${app_root}/docs/DEVELOPMENT.md"
declare docs_contribute="CONTRIBUTING.md:${root_dir}/docs/CONTRIBUTING.md:${app_root}/docs/CONTRIBUTING.md"
declare docs_requirements="REQUIREMENTS.md:${root_dir}/docs/REQUIREMENTS.md:${app_root}/docs/REQUIREMENTS.md"
declare docs_license="LICENSE:${root_dir}/docs/LICENSE:${app_root}/docs/LICENSE"
copy_element "${docs_arch}" "${docs_deploy}" "${docs_dev}" "${docs_contribute}" "${docs_requirements}" "${docs_license}"
# eslint
echo "INF~ Copying Eslint files" >&2
declare eslint_config="eslint.config.js:${root_dir}/templates/eslint/eslint.config.js.sample:${app_root}/eslint.config.js"
copy_element "${eslint_config}"
# git
echo "INF~ Copying Git files" >&2
declare git_ignore=".gitignore:${root_dir}/templates/git/.gitignore.sample:${app_root}/.gitignore"
copy_element "${git_ignore}"
# jest
echo "INF~ Copying Jest files" >&2
declare jest_config="jest.config.js:${root_dir}/templates/jest/jest.config.js.sample:${app_root}/jest.config.js"
copy_element "${jest_config}"
# npm
echo "INF~ Copying NPM files" >&2
declare npm_lock="package-lock.json:${root_dir}/templates/npm/package-lock.json.sample:${app_root}/package-lock.json"
declare npm_package="package.json:${root_dir}/templates/npm/package.json.sample:${app_root}/package.json"
copy_element "${npm_lock}" "${npm_package}"
# prettier
echo "INF~ Copying Prettier files" >&2
declare prettier_ignore=".prettierignore:${root_dir}/templates/prettier/.prettierignore.sample:${app_root}/.prettierignore"
declare prettier_rc=".prettierrc.json:${root_dir}/templates/prettier/.prettierrc.json.sample:${app_root}/.prettierrc.json"
copy_element "${prettier_ignore}" "${prettier_rc}"
# tsc
echo "INF~ Copying Typechek files" >&2
declare tsc_config="jsconfig.json:${root_dir}/templates/tsc/jsconfig.json.sample:${app_root}/jsconfig.json"
copy_element "${tsc_config}"
# types
echo "INF~ Copying Types files" >&2
declare types_gasm="gasm.d.ts:${root_dir}/templates/types/gasm.d.ts.sample:${app_root}/types/gasm.d.ts"
copy_element "${types_gasm}"
# End message
echo "INF~ App files updated" >&2
