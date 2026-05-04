#!/usr/bin/env bash
# Detect whether the current shell is in an "infrastructure context" —
# the gating signal shared by the kubernetes and AWS prompt segments.
#
# `check` — exit 0 if the current dir (or an ancestor up to the git
#           root) looks like infra; 1 otherwise. Cheap; no network or
#           tool invocations.
#
# Triggers:
#   - The repo's basename contains a known infra keyword (e.g. a
#     folder named "*-infrastructure" or "*-terraform").
#   - An infra config file is present (Chart.yaml, kustomization.yaml,
#     skaffold.yaml, k8s.yaml).
#   - A known infra subdirectory is present (k8s, manifests, kubernetes,
#     deploy, deployments, infrastructure, infra, charts, helm,
#     terraform).

set -u

is_infra_dir() {
  local root
  root=$(git rev-parse --show-toplevel 2>/dev/null) || return 1
  local infra_names=(k8s manifests kubernetes deploy deployments infrastructure infra charts helm terraform)
  local base
  base=$(basename "$root")
  for n in "${infra_names[@]}"; do
    [[ "$base" == *"$n"* ]] && return 0
  done
  local dir="$PWD"
  while [ "$dir" = "$root" ] || [[ "$dir" == "$root"/* ]]; do
    for f in Chart.yaml skaffold.yaml kustomization.yaml k8s.yaml; do
      [ -f "$dir/$f" ] && return 0
    done
    for d in "${infra_names[@]}"; do
      [ -d "$dir/$d" ] && return 0
    done
    [ "$dir" = "$root" ] && break
    dir=$(dirname "$dir")
  done
  return 1
}

case "${1:-check}" in
  check)
    is_infra_dir
    ;;
  *)
    echo "usage: $0 check" >&2
    exit 2
    ;;
esac
