if [ -z "${XDG_SESSION_TYPE}" ]; then
  export PLATFORM="$(uname)_$(uname -m)"
else
  export PLATFORM="$(uname)_${XDG_SESSION_TYPE}_$(uname -m)"
fi

if _check_bin_present 'antibody' 2>/dev/null ; then
  if [ ! -f "${HOME}/.config/zsh/plugins.zsh" ] ; then
    antibody bundle < ~/.config/zsh/plugins > ~/.config/zsh/plugins.zsh
    source ~/.config/zsh/plugins.zsh
  fi
fi

if  _check_bin_present 'starship' 2>/dev/null ; then
  eval "$(starship init zsh)"
else
  # Fallback when starship not available
  export PS1='%F{150}%n%F{reset}@%F{cyan}%m%F{bold}%F{yellow}::%F{reset}%F{cyan}%~%F{magenta}»%F{reset} '
fi

# Platform specific
case "${PLATFORM}" in
  'Linux'*)
    source /usr/share/fzf/key-bindings.zsh
    ;;
  'Darwin'*)
    eval "$(/opt/homebrew/bin/brew shellenv)"
    source /opt/homebrew/Cellar/fzf/*/shell/key-bindings.zsh
    source <(kubectl completion zsh)
    ;;
  *)
    ;;
esac
