# Platform specific
case "${PLATFORM}" in
  'Darwin'*)
    alias grep='ggrep --color=auto'
    alias ls='gls --color=auto'
    ;;
  'Linux'*)
    alias grep='grep --color=auto'
    alias ls='ls --color=auto'
    ;;
  *)
    ;;
esac

# Generic
alias ip='ip -c'
alias ncdu='ncdu --color dark'
alias tmux='tmux -u'

alias l='ls -alh --color=auto'
alias ll='ls -lh --color=auto'

alias vi='nvim'
alias vim='nvim'

alias top='bpytop'

alias sudo='sudo '

alias g='git'
alias kb='kubectl'
alias kx='kubectx'
alias ku='kubectx -u'
alias kns='kubens'

alias yayskip='yay -S --mflags --skipinteg'
alias ytm='yt-dlp -x --audio-format mp3'

[ -f "${XDG_CONFIG_HOME:-$HOME/.config}/neofetch/ascii" ] && alias neofetch="neofetch --source ${XDG_CONFIG_HOME:-$HOME/.config}/neofetch/ascii"

alias xz='xz -T0'
alias unxz='xz -d -T0'

alias zstd='zstd -T0'
alias unzstd='zstd -d -T0'

if _check_bin_present 'lbzip2' ; then
  alias bzip2='lbzip2'
  alias bunzip2='lbzip2 -d'
elif _check_bin_present 'pbzip2' ; then
  alias bzip2='pbzip2'
  alias bunzip2='pbzip2 -d'
else
  :
fi

if _check_bin_present 'pigz' ; then
  alias gzip='pigz'
  alias gunzip='pigz -d'
else
  :
fi
