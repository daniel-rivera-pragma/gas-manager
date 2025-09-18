#!/bin/bash
set -euo pipefail
declare root_dir="${1}" && shift
# Initialize
echo "INF~ init command started" >&2
[ ${#} -eq 0 ] && echo "ERR~ A name must be specified to init an app" >&2 && exit 1
declare app_name="${1}"
[ -z "$(echo "${app_name}" | grep -E "^[[:alpha:][:digit:][:space:]-]+$")" ] && echo "ERR~ App name can only contain letters, numbers and spaces" >&2 && exit 1
app_name=$(echo "${app_name}" | tr "[:upper:]" "[:lower:]" | sed -E -e "s/^[[:space:]-]*//" -e "s/[[:space:]-]*$//" -e "s/[[:space:]-]+/-/g")
declare app_root="./${app_name}"
echo -e "     - App name: ${app_name}\n     - App root: ${app_root}" >&2
# Copy element function
declare element
declare element_info
function copy_element() {
  for element in "${@}"; do
    element_info=(${element//:/ })
    echo -e "     - ${element_info[0]}\c" >&2
    cp "${element_info[1]}" "${element_info[2]}" && echo " [OK]" >&2
  done
}
# Scafold
echo "INF~ Scafolding directories" >&2
declare dir_app="App:${app_root}"
declare dir_vscode="VSCode:${app_root}/.vscode"
declare dir_src="Sources:${app_root}/src"
declare dir_tests="Tests:${app_root}/tests"
declare dir_docs="Documentation:${app_root}/docs"
declare dir_types="Types:${app_root}/types"
for element in "${dir_app}" "${dir_vscode}" "${dir_src}" "${dir_tests}" "${dir_docs}" "${dir_types}"; do
  element_info=(${element//:/ })
  echo -e "     - ${element_info[0]} directory\c" >&2
  mkdir -p "${element_info[1]}" && echo " [OK]" >&2
done
# .vscode
echo "INF~ Copying VSCode files" >&2
declare vscode_settings="settings.json:${root_dir}/templates/vscode/settings.json.sample:${app_root}/.vscode/settings.json"
declare vscode_extensions="extensions.json:${root_dir}/templates/vscode/extensions.json.sample:${app_root}/.vscode/extensions.json"
copy_element "${vscode_settings}" "${vscode_extensions}"
# docs
echo "INF~ Copying Documentation files" >&2
declare docs_arch="ARCHITECTURE.md:${root_dir}/templates/docs/ARCHITECTURE.md.sample:${app_root}/docs/ARCHITECTURE.md"
declare docs_deploy="DEPLOYMENT.md:${root_dir}/templates/docs/DEPLOYMENT.md.sample:${app_root}/docs/DEPLOYMENT.md"
declare docs_dev="DEVELOPMENT.md:${root_dir}/templates/docs/DEVELOPMENT.md.sample:${app_root}/docs/DEVELOPMENT.md"
declare docs_contribute="CONTRIBUTING.md:${root_dir}/docs/CONTRIBUTING.md:${app_root}/docs/CONTRIBUTING.md"
declare docs_license="LICENSE:${root_dir}/docs/LICENSE:${app_root}/docs/LICENSE"
declare docs_readme="README.md:${root_dir}/templates/docs/README.md.sample:${app_root}/docs/README.md"
copy_element "${docs_arch}" "${docs_deploy}" "${docs_dev}" "${docs_contribute}" "${docs_license}" "${docs_readme}"
# eslint
echo "INF~ Copying Eslint files" >&2
declare eslint_globals="eslint.globals.js.sample:${root_dir}/templates/eslint/eslint.globals.js.sample:${app_root}/eslint.globals.js.sample"
declare eslint_config="eslint.config.js:${root_dir}/templates/eslint/eslint.config.js.sample:${app_root}/eslint.config.js"
copy_element "${eslint_globals}" "${eslint_config}"
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
declare types_gas="google-apps-script.d.ts:${root_dir}/templates/types/google-apps-script.d.ts.sample:${app_root}/types/google-apps-script.d.ts"
declare types_mods="modules.d.ts:${root_dir}/templates/types/modules.d.ts.sample:${app_root}/types/modules.d.ts"
copy_element "${types_gas}" "${types_mods}"
# Update placeholders
echo "INF~ Update files placeholders"
declare files_to_replace=("docs/README.md" "package.json" "package-lock.json")
for element in "${files_to_replace[@]}"; do
  echo -e "     - ${element}\c" >&2
  sed -i -e "s/%APP_NAME%/${app_name}/g" "${app_root}/${element}" && echo " [OK]" >&2
done
# End message
echo "INF~ App created, type 'cd ${app_name}' to start developing"
