#!/bin/bash

BASE=$(dirname $(readlink -f "$0"))
source "$BASE/lib_path.sh"

run_hook() {
  action="$2"

  # Variables avaiable in the hook
  # also HCM_TARGET_DIR
  set -a
  CM_DIR="$1"
  HOOK_CWD="$(hook_work_dir_for "$(basename "$CM_DIR")")"
  set +a

  (
    source "$(module_file_for "$CM_DIR")"

    if [[ "$(type -t "$action")" == "function" ]]; then
      mkdir -p "$HOOK_CWD"
      cd "$HOOK_CWD"
      $action
    fi
  )
}

run_hook "$@"
