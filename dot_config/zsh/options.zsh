setopt append_history
setopt extended_history
setopt hist_expire_dups_first
setopt hist_ignore_dups
setopt hist_ignore_space
setopt hist_verify
setopt inc_append_history
setopt share_history
setopt rmstarsilent
setopt interactivecomments

unsetopt completealiases


autoload -Uz promptinit
autoload -Uz compinit
autoload -Uz bashcompinit
if [[ -n "${ZDOTDIR}/.zcompdump(#qN.mh+24)" ]]; then
  compinit
  bashcompinit
  promptinit
else
  compinit -C
  bashcompinit -C
  promptinit -C
fi
setopt PROMPT_SUBST
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}' 'r:|=*' 'l:|=* r:|=*'
zstyle ':completion:*' menu select

autoload -U select-word-style
select-word-style normal
