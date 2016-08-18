#
# OSX Specific Commands
#

# Mac app shortcuts
alias finder="open -a 'Finder' $@"
alias sub="open -a 'Sublime Text 2' $@"
alias atom="open -a 'Atom' $@"
alias -g copy="pbcopy"
alias -g paste="pbpaste"

# Don't show groups on Macs
alias ls='ls -G'

# Editor
alias a='atom'
# Set JAVA_HOME
export JAVA_HOME=$(/usr/libexec/java_home)
