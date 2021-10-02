#!/bin/sh

_run_if_binary_exists() {
  if command -v "${1}" > /dev/null 2>&1 ; then
    pgrep "${1}" > /dev/null 2>&1 || eval "$@"
  else
    :
  fi
}

_run_if_file_exists() {
  if [ -f "${1}" ]; then
    eval "_run_if_binary_exists ${2}"
  else
    :
  fi
}

_kill_if_running(){
  if pgrep "${1}" ; then
    pkill "${1}"
  else
    :
  fi
}

_action_if_systemd_service_exists() {
  if systemctl --user cat -- "${2}" > /dev/null 2>&1 ; then
    systemctl --user "${1}" "${2}"
  else
    :
  fi
}

_start_if_service_exists() {
  _action_if_systemd_service_exists 'start' "${1}"
}

_stop_if_service_exists() {
  _action_if_systemd_service_exists 'stop' "${1}"
}

_eww() {
  CONFIG_PATH="${XDG_CONFIG_HOME:-$HOME/.config}/leftwm/themes/current/eww-bar"
  case "${1}" in
    'start')
      pkill eww
      _run_if_binary_exists eww daemon --config "${CONFIG_PATH}" &

      LQD_FILE="${XDG_CONFIG_HOME:-$HOME/.config}/leftwm/themes/current/sizes.liquid"
      eww --config "${CONFIG_PATH}" \
        open-many \
        $(seq -f "bar%g" -s ' ' "$(leftwm-state -q -n -t "${LQD_FILE}" | sed -r '/^\s*$/d' | wc -l)")
      ;;
    'stop')
      pkill eww
      ;;
    *)
      ;;
  esac
}

_theme() {
  PIPE="${XDG_RUNTIME_DIR}/leftwm/commands.pipe"
  case "${1}" in
    'load') 
      printf 'LoadTheme %s/leftwm/themes/current/theme.toml' \
        "${XDG_CONFIG_HOME:-$HOME/.config}" \
        > "${PIPE}"
      ;;
    'unload')
      printf 'UnloadTheme' \
        > "${PIPE}"
      ;;
    *)
      ;;
  esac
}
