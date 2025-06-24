#
# OSX Specific Commands
#

# Mac app shortcuts
alias finder="open -a 'Finder' $@"
alias sub="open -a 'Sublime Text' $@"
alias vsc="open -a 'Visual Studio Code'"
alias -g copy="pbcopy"
alias -g paste="pbpaste"

# ls opts:
#   G: Color mac output
#   F: Show file types
#   h: Human file sizes
#   v: Natural order
#
# Source: https://www.topbug.net/blog/2016/11/28/a-better-ls-command/
#
export COLUMNS
export CLICOLOR_FORCE=1
function ls {
    command ls -GFhv -C "$@" | less -RXF
}
alias la='ls -A'
alias ll='ls -l'
alias lla='ls -Al'
alias l='ls -A -l'

# Editor
#a () {
#    if [ $# -eq 0 ]; then
#        atom .
#    else
#        atom $1
#    fi
#}
#alias a='atom'
# Set JAVA_HOME
#export JAVA_HOME=$(/usr/libexec/java_home)

# Copy current branch to clipboard
alias getbr="git branch --no-color | grep \"^\\*\" | cut -d' ' -f2 | tr -d '\n' | pbcopy"
