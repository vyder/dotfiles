#
# .zshrc
#

#======

# -COMPLETION SETTINGS

# --Turn on autocomplete
autoload -U compinit
compinit

# --Allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# --Show completion menu when number of options is at least 2
zstyle ':completion:*' menu select=2

# --Case-insensitive (all) completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

#======

# -GLOBBING

# --Expands to zero args if glob finds no match
setopt nullglob

#======

# -COLORS
autoload -U colors
export LSCOLORS=cxfxfxfxbxegedabagacad
zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}
alias ls='ls -G'

#======

# -ENV

# --Editor
export EDITOR="nano"

# --Bind Keys
bindkey -e
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# My binaries
export PATH=$HOME/bin:$PATH

# --RBENV
if ! type "$rbenv" > /dev/null; then
    eval "$(rbenv init -)"
fi

# --Aliases
source $ZSH/aliases.zsh

#======

# -PROMPT
PS1="%2c:$ "

#======

# -MISC

# --Never ever beep ever
setopt NO_BEEP

# -- Display completion waiting dots
# --- src: http://stackoverflow.com/a/844299
expand-or-complete-with-dots() {
  echo -n "\e[31m......\e[0m"
  zle expand-or-complete
  zle redisplay
}
zle -N expand-or-complete-with-dots
bindkey "^I" expand-or-complete-with-dots

# --Red dots displayed while waiting for completion
# COMPLETION_WAITING_DOTS="true"

#======

# -NOTIFY
notification="$ZSH/.notify"
if [ -f "$notification" ]; then
    UPDATED=$(cat $notification)
    if [ "$UPDATED" = "YES" ]; then
        echo "${GREEN}Your dotfiles have been updated.${RESET}"
        echo "NO" > $notification
    fi
fi
