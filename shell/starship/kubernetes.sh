#!/usr/bin/env bash
# Kubectl segment for the starship prompt.
#
# `check`  — exit 0 if the segment should render; 1 otherwise. Two
#             signals (either is enough):
#               1. infra.sh check (dir-based infra context)
#               2. `kubectl` was invoked in this shell within the last
#                  hour (preexec hook exports KUBECTL_LAST_TS)
# `render` — emit the aliased context (e.g. "⎈ dev"). Calls kubectl.

set -u

RECENT_SECONDS=3600

is_recent() {
  [ -n "${KUBECTL_LAST_TS:-}" ] || return 1
  [ $(( $(date +%s) - KUBECTL_LAST_TS )) -lt "$RECENT_SECONDS" ]
}

case "${1:-check}" in
  check)
    is_recent || "$(dirname "$0")/infra.sh" check
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
