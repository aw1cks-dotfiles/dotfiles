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
alias ll='ls -l --color=auto'

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
