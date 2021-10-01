###
# Utility functions
###
# detect current platform
function _platform() {
  if [ -z "${XDG_SESSION_TYPE}" ]; then
    printf "$(uname)_$(uname -m)"
  else
    printf "$(uname)_${XDG_SESSION_TYPE}_$(uname -m)"
  fi
}
# check binary present, else return an error
function _check_bin_present() {
  if [ -z "$(command -v ${1})" ]; then
    printf 'Binary %s not in $PATH\n' "${1}"
    return 1
  fi
}

# Update antibody plugins
function antibody-update() {
  _check_bin_present 'antibody'
  antibody bundle < ~/.config/zsh/plugins > ~/.config/zsh/plugins.zsh
}

# Set our window title to current user/directory
case "${TERM}" in
  'xterm'*)
    function precmd() {
      print -Pn "\e]0;${PWD/#${HOME}/~${USER}}\a"
    }
    ;;
esac

# Copy to clipboard
function copy() {
  case "$(_platform)" in
    'Darwin'*)
      local cmd='pbcopy' 
      ;;
    'Linux_x11'*)
      _check_bin_present 'xclip' || return 1
      local cmd='xclip -sel clip'
      ;;
    'Linux_wayland'*)
      _check_bin_present 'wl-copy' || return 1
      local cmd='wl-copy'
      ;;
    'Linux'*)
      printf 'Neither X11 nor Wayland detected\n'
      return 1
      ;;
    *)
      printf 'Unsupported OS\n'
      return 1
      ;;
  esac

  # Allow piping in, if not providing an argument
  # If an argument is provided, we assume it's a file name, and read it
  # Read with sudo by using `-s` flag
  while getopts 's' arg; do
    case "${arg}" in
      's') local use_sudo='1' ;;
      *) ;;
    esac
  done
  shift "$((OPTIND-1))"

  if [ -z "${1}" ]; then
    eval "${cmd}"
  else
    if [ -n "${use_sudo}" ]; then
      eval "sudo cat ${1} | tee /dev/tty | ${cmd}"
    else
      eval "tee /dev/tty < ${1} | ${cmd}"
    fi
  fi
}

# Paste from clipboard
function paste() {
  case "$(_platform)" in

    'Darwin'*)
      local cmd='pbpaste' 
      ;;
    'Linux_x11'*)
      _check_bin_present 'xclip' || return 1
      local cmd='xclip -sel clip -o'
      ;;
    'Linux_wayland'*)
      _check_bin_present 'wl-paste' || return 1
      local cmd='wl-paste'
      ;;
    'Linux'*)
      printf 'Neither X11 nor Wayland detected\n'
      return 1
      ;;
    *)
      printf 'Unsupported OS\n'
      return 1
      ;;
  esac

  # Allow piping in, if not providing an argument
  # If an argument is provided, we assume it's a file name, and write to it
  # Allow appending by passing `-a` flag
  # Use sudo tee with `-s` flag
  while getopts 'as' arg; do
    case "${arg}" in
      'a') local append_str='-a' ;;
      's') local use_sudo='sudo' ;;
      *) ;;
    esac
  done
  shift "$((OPTIND-1))"

  if [ -z "${1}" ]; then
    printf 'No target file provided\n'
    return 1
  else
    eval "${cmd} | ${use_sudo} tee ${append_str} ${1}"
  fi
}

# Upload to p.mort.coffe pastebin service
function pastebin() {
  # Allow piping in, if not providing an argument (write to stdout as well)
  # If an argument is provided, we assume it's a file name, and read it
  # Read with sudo by using `-s` flag

  _check_bin_present 'curl' || return 1

  while getopts 's' arg; do
    case "${arg}" in
      's') local use_sudo='sudo' ;;
      *) ;;
    esac
  done
  shift "$((OPTIND-1))"

  if [ $# -eq 0 ]; then
    tee /dev/tty < /dev/stdin | curl -X PUT -d @- https://p.mort.coffee
  else
    eval "${use_sudo} curl --upload-file ${1} https://p.mort.coffee"
  fi
}

# Make directory and push it into the directory stack
function mkp() {
  mkdir -p "${1}"
  pushd "${1}"
}

# Recursively delete last directory from directory stack
function rmp() {
  if [ "$(dirs -lp | wc -l)" -ge 2 ]; then
    local stack_top="$(dirs -lp | head -1)"
    printf "WARNING: will delete '${stack_top}'. Press 'y' to continue: "
    if [ "$(read -e -q)" = 'y' ]; then
      printf '\n'
      popd > /dev/null
      rm -rf "${stack_top}"
    fi
  else
    printf 'Directory stack only contains 1 directory\n'
    return 1
  fi
}

# Add colors to man pages
function man() {
  _check_bin_present 'man' || return 1

  env \
    LESS_TERMCAP_mb=$(printf "\e[1;31m") \
    LESS_TERMCAP_md=$(printf "\e[1;31m") \
    LESS_TERMCAP_me=$(printf "\e[0m") \
    LESS_TERMCAP_se=$(printf "\e[0m") \
    LESS_TERMCAP_so=$(printf "\e[1;44;33m") \
    LESS_TERMCAP_ue=$(printf "\e[0m") \
    LESS_TERMCAP_us=$(printf "\e[1;32m") \
      man "$@"
}

# Make sure we run yay as the `aurbuilder` user
# Add --cleanafter to clean AUR pkgs after successful install
# Add --devel to check for newer git revisions for `-git` packages
function yay() {
  _check_bin_present 'yay' || return 1

  local YAY_CMD='sudo -u aurbuilder yay --cleanafter --devel --nodiffmenu --noeditmenu --noremovemake --redownloadall --rebuildtree'

  if [ "$#" -eq 0 ]; then
    eval "${YAY_CMD} -Syu"
  else
    case $@ in
      '-Q'*) eval "yay $@" ;;
      *) eval "${YAY_CMD} $@" ;;
    esac
  fi
}
