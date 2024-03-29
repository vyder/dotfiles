alias c='clear'
alias server='python -m SimpleHTTPServer'
alias getip='curl ipinfo.io'
alias -g L='less -Rf'
t () {
        if [ $# -eq 0 ]; then
                tree -Ca -L 1 .
        else
                # If first arg is a number
                if [ $1 -eq $1 2> /dev/null ]; then
                        tree -Ca -L "$1" .
                # Else if first arg is a directory
                elif [ -d $1 ]; then

                        # If second arg is a number
                        if [ $2 -eq $2 2> /dev/null ]; then
                                tree -Ca -L "$2" "$1"
                        else
                                tree -Ca -L 1 "$1"
                        fi
                else # probably passed in custom args
                        tree -Ca "$@"
                fi
        fi
}
alias n='nano'
alias be='bundle exec'
alias reload='source ~/.zshrc'
alias sleep='pmset sleepnow'
alias load_scmpuff='eval "$(scmpuff init -s --aliases=false)"'
alias y='yarn'

# Laravel Sail
alias sail='bash vendor/bin/sail'
