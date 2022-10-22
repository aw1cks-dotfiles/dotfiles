# Platform specific

case "${PLATFORM}" in
  'Darwin'*)
    if _check_bin_present 'ggrep' 2>/dev/null ; then
      GREP_BINARY='ggrep --color=auto'
    fi
    if _check_bin_present 'gls' 2>/dev/null ; then
      LS_BINARY='gls --color=auto'
    fi
    ;;
esac

if _check_bin_present 'rg' 2>/dev/null ; then
  GREP_BINARY='rg'
else
  alias rg='grep'
fi

# END platform specific

alias fgrep="${GREP_BINARY:-grep --color=auto} -F"
alias grep="${GREP_BINARY:-grep --color=auto}"

alias ls="${LS_BINARY:-ls --color=auto}"
alias l="${LS_BINARY:-ls --color=auto} -alh"
alias ll="${LS_BINARY:-ls --color=auto} -lh"

alias ip='ip -c'

alias ncdu='ncdu --color dark'

alias tmux='tmux -u'

# Adding the space will respect user's aliases
alias sudo='sudo '

alias g='git'

alias py='python3'
alias pip='python3 -m pip'
alias venv='python3 -m venv'
alias venvdown='deactivate'

alias kb='kubectl'
alias kx='kubectx'
alias ku='kubectx -u'
alias kns='kubens'

alias yayskip='yay -S --mflags --skipinteg'
alias ytm='yt-dlp -x --audio-format mp3'

alias xz='xz -T0'
alias unxz='xz -d -T0'

alias zstd='zstd -T0'
alias unzstd='zstd -d -T0'

# Conditionals
# These alias differently depending on what programs are installed.

if _check_bin_present 'lbzip2' 2>/dev/null ; then
  alias bzip2='lbzip2'
  alias bunzip2='lbzip2 -d'
elif _check_bin_present 'pbzip2' 2>/dev/null ; then
  alias bzip2='pbzip2'
  alias bunzip2='pbzip2 -d'
else
  :
fi

if _check_bin_present 'pigz' 2>/dev/null ; then
  alias gzip='pigz'
  alias gunzip='pigz -d'
else
 :
fi

if _check_bin_present 'bpytop' 2>/dev/null ; then
  alias top='bpytop'
elif _check_bin_present 'htop' 2>/dev/null ; then
  alias top='htop'
else
  :
fi

if _check_bin_present 'nvim' 2>/dev/null ; then
  alias vi='nvim'
  alias vim='nvim'
elif _check_bin_present 'vim' 2>/dev/null; then
  alias vi='vim'
  alias nvim='vim'
else
  alias vim='vi'
  alias nvim='vi'
fi

# Alias some common typos to save time
alias sl='ls'
