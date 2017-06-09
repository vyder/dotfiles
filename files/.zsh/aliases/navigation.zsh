# Favorite places
alias ..='cd ..'
alias ....='cd ../..'
alias ~='cd ~'
alias cD='cd ~/Desktop'

md () { mkdir -p "$1" && cd "$1"; } # make and change to a directory
cdl () { cd "$1" && ls -l; } # change directory and list
