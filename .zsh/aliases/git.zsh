# git clone
alias clone='git clone'

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
    branch=""
    if [ $1 = "." ]; then
        branch=$(git symbolic-ref --short HEAD);
    else
        branch="$1";
    fi

    git push origin "$branch";
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
