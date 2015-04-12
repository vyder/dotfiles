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

# Mongodb
export PATH=/usr/local/mongodb/bin:$PATH

# --RBENV
if ! type "$rbenv" > /dev/null; then
    eval "$(rbenv init -)"
fi

# --Aliases
source $ZSH/aliases/colors.zsh
source $ZSH/aliases/git.zsh
source $ZSH/aliases/navigation.zsh
source $ZSH/aliases/util.zsh

#===========

# -OVERRIDES

# Add OS specific config
if [[ $(uname -s | grep -i "Darwin") == "Darwin" ]]; then
    source $ZSH/os/osx.zsh
fi

# Finally override with host specific config
#
# --------          -----------------------------
# HostName          Expected Host Config Filename
# --------          -----------------------------
# Example.local     Example.zsh
# example.io        example-io.zsh
# example           example.zsh
#
#

# Standardize hostname
host=$(hostname | sed 's/\./-/g' | sed 's/-local$//' )

host_config="$ZSH/host/$host.zsh"

# Source config if file exists
if [[ -f $host_config ]]; then
    source $host_config
fi
