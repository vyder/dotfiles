source $ZSH/.aliases/colors.alias
source $ZSH/.aliases/git.alias
source $ZSH/.aliases/navigation.alias
source $ZSH/.aliases/util.alias

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