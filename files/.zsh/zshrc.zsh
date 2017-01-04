#
# .zshrc
#

#======

# -COMPLETION SETTINGS

# --Turn on autocomplete
autoload -U compinit
compinit

# Disable hostname completion
zstyle ':completion:*' hosts off

# Disable completion for *.meta files (Unity)
zstyle ':completion:*' ignored-patterns '*?.meta'

# --Allow tab completion in the middle of a word
setopt COMPLETE_IN_WORD

# --Show completion menu when number of options is at least 2
# (Takes a while to load)
# zstyle ':completion:*' menu select=2

# --Case-insensitive (all) completion
zstyle ':completion:*' matcher-list 'm:{a-zA-Z}={A-Za-z}'

#======

# -GLOBBING

# --Expands to zero args if glob finds no match
setopt nullglob

#======

# -COLORS
# autoload -U colors && colors
export LSCOLORS=cxfxfxfxbxegedabagacad
setopt promptsubst
setopt promptpercent
# zstyle ':completion:*:default' list-colors ${(s.:.)LS_COLORS}

# Note: Don't alias 'ls -G' here.
# ls options differ by OS

#======

# -DEFAULT PROMPT
# source: https://github.com/sindresorhus/pure#getting-started
if [ -e /usr/local/share/zsh/site-functions/prompt_pure_setup ]; then
  autoload -U promptinit && promptinit
  prompt pure
else
  PS1="%2c:$ "
fi

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

# -ENV + OVERRIDES

source $ZSH/zshenv.zsh

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

#======
