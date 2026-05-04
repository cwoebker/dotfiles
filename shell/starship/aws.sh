#!/usr/bin/env bash
# Decide whether to render the AWS segment in the starship prompt.
#
# `check`  — exit 0 if the segment should render; 1 otherwise. Two
#             conditions, both required:
#               1. infra.sh check (dir-based infra context)
#               2. an AWS profile is explicitly set ($AWS_PROFILE)
#             Without (2) the segment stays hidden — implicit "[default]"
#             is a weak signal not worth the visual noise.
# `render` — emit "$profile @ $region" using env vars only (no `aws`
#             CLI calls — too slow for a prompt).

set -u

case "${1:-check}" in
  check)
    [ -n "${AWS_PROFILE:-}" ] || exit 1
    "$(dirname "$0")/infra.sh" check
    ;;
  render)
    [ -n "${AWS_PROFILE:-}" ] || exit 1
    region="${AWS_REGION:-${AWS_DEFAULT_REGION:-}}"
    if [ -n "$region" ]; then
      echo "$AWS_PROFILE @ $region"
    else
      echo "$AWS_PROFILE"
    fi
    ;;
  *)
    echo "usage: $0 {check|render}" >&2
    exit 2
    ;;
esac
