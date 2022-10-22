export GOPATH="${HOME}/.local/go"
export PATH="${PATH}:${HOME}/.local/bin:${GOPATH}/bin:${GOPATH}/flutter/bin"

export EDITOR=nvim
export QT_QPA_PLATFORMTHEME=qt5ct
export CLICOLOR=1
export DOCKER_BUILDKIT=1

export FZF_DEFAULT_OPTS='--height 30% --layout=reverse'
export STEAM_COMPAT_DATA_PATH="${HOME}/.proton"

# Platform specific
case "${PLATFORM}" in
  'Linux'*)
    if [ -f '/etc/os-release' ] ; then
      export DISTRO="$(source '/etc/os-release'; echo "${NAME}")"
    else
      export DISTRO='unknown'
    fi
    ;;
  'Darwin'*)
    export DISTRO='macOS'
    ;;
  *)
    ;;
esac
