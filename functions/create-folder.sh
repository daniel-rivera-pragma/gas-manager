#!/bin/bash
function create_folder() {
  local element
  local element_info
  for element in "${@}"; do
    element_info=(${element//:/ })
    echo -e "     - ${element_info[0]} directory\c" >&2
    mkdir -p "${element_info[1]}" && echo " [OK]" >&2
  done
}
