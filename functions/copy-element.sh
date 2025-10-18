#!/bin/bash
function copy_element() {
  local element
  local element_info
  for element in "${@}"; do
    element_info=(${element//:/ })
    echo -e "     - ${element_info[0]}\c" >&2
    cp "${element_info[1]}" "${element_info[2]}" && echo " [OK]" >&2
  done
}
