source $ZSH/.aliases/colors.alias
source $ZSH/.aliases/git.alias
source $ZSH/.aliases/navigation.alias
source $ZSH/.aliases/util.alias

# Add OS specific aliases
if [[ $(uname -s | grep -i "Darwin") == "Darwin" ]]; then
    source $ZSH/.aliases/osx.alias
fi
