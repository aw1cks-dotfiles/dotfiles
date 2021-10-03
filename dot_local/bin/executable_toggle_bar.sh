#!/bin/sh

# https://github.com/koalaman/shellcheck/issues/2343
# shellcheck disable=SC1091
. "${XDG_CONFIG_HOME:-$HOME/.config}/leftwm/themes/current/common.sh"

_toggle_eww
