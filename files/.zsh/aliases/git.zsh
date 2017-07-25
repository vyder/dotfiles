# git add
alias ga='git add'

# git branch
alias gba='git branch -avv'
alias gb='git branch'
alias gbd='git branch -d'

# git checkout
alias gc='git checkout'
alias gcb='git checkout -b'
alias gct='git checkout -t'

# git pull
alias gpr='git pull --rebase'
function pull () { git pull origin "$1"; }

# git push
function push () {
    if [ -z "$1" ]; then
        branch=$(git branch --no-color | grep '^\*' | cut -d' ' -f2);
    else
        branch="$1";
    fi
    git push origin "$branch";
}

# Delete remote branch and push current one
function replace () {
    if [ -z "$1" ]; then
        branch=$(git branch --no-color | grep '^\*' | cut -d' ' -f2);
    else
        branch="$1";
    fi
    git push origin :"$branch";
    git push origin "$branch";
}

# git push && track
function pusht () {
    if [ -z "$1" ]; then
        branch=$(git branch --no-color | grep '^\*' | cut -d' ' -f2);
    else
        branch="$1";
    fi
    git push -u origin "$branch";
}

# git rm
alias gr='git rm'

# git stash
function stash () { git stash "$@"; }

# git commit
alias gcaa='git commit -a --amend --no-edit'
function commit () { git commit -m "$1"; }
function squish () { ga .; commit "squish"; git rebase -i HEAD~"$1"; }

# git status - all the typos
alias gstat='git status'
alias gstta='git status'
alias gsatt='git status'
alias gstt='git status'
alias gsat='git status'
alias gsta='git status'

# Disable till you figure out a way to use
# it without overriding regular git binary
# - 8/5/2015
#
# if [[ -n "$(which scmpuff)" ]]; then
#    eval "$(scmpuff init -s)"
# fi
