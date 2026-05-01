#!/usr/bin/env bash
# Decide whether to render the kubectl segment in the starship prompt.
#
# `check`  — exit 0 if the segment should render; 1 otherwise. Cheap;
#             no kubectl call.
# `render` — emit the aliased context (e.g. "⎈ dev"). Calls kubectl.
#
# Triggers (any one is enough):
#   1. The current directory or an ancestor contains k8s config
#      (Chart.yaml, kustomization.yaml, k8s/ folder, etc).
#   2. `kubectl` was invoked within the last hour (via preexec hook
#      that touches ~/.cache/last-kubectl).

set -u

SENTINEL="$HOME/.cache/last-kubectl"
RECENT_SECONDS=3600

is_recent() {
  [ -f "$SENTINEL" ] || return 1
  local now mtime
  now=$(date +%s)
  mtime=$(stat -f %m "$SENTINEL" 2>/dev/null || echo 0)
  [ $((now - mtime)) -lt "$RECENT_SECONDS" ]
}

is_k8s_dir() {
  local dir="$PWD"
  while [ "$dir" != "/" ]; do
    for f in Chart.yaml skaffold.yaml kustomization.yaml k8s.yaml; do
      [ -f "$dir/$f" ] && return 0
    done
    for d in k8s manifests kubernetes deploy deployments infrastructure infra charts helm; do
      [ -d "$dir/$d" ] && return 0
    done
    dir=$(dirname "$dir")
  done
  return 1
}

case "${1:-check}" in
  check)
    is_recent || is_k8s_dir
    ;;
  render)
    ctx=$(kubectl config current-context 2>/dev/null) || exit 1
    [ -n "$ctx" ] || exit 1
    case "$ctx" in
      *prod*) echo "⚠ prod" ;;
      *dev*)  echo "⎈ dev" ;;
      *)      echo "⎈ $ctx" ;;
    esac
    ;;
  *)
    echo "usage: $0 {check|render}" >&2
    exit 2
    ;;
esac
