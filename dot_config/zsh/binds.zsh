bindkey -e
bindkey '^i' expand-or-complete-prefix
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word
bindkey '^[[H' beginning-of-line
bindkey '^[[F' end-of-line
bindkey '^[[H' beginning-of-line
bindkey '^[[Z' end-of-line
bindkey '\e[Z' reverse-menu-complete
bindkey '^[[3~' delete-char
bindkey '\e[A' history-beginning-search-backward
bindkey '\e[B' history-beginning-search-forward
# bindkey -s sends literal string to prompt
# ^u clears line; ^M sends carriage return
bindkey -s '^k' '^ukubectx^M'
bindkey -s '^[^k' '^ukubectx -u^M'
bindkey -s '^n' '^ukubens^M'
