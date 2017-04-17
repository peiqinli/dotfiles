# Path to Oh My Fish install.
set -q XDG_DATA_HOME
  and set -gx OMF_PATH "$XDG_DATA_HOME/omf"
  or set -gx OMF_PATH "$HOME/.local/share/omf"

alias ef 'vim ~/.config/fish/config.fish'
##----GIT------
alias gs='clear ;and git status'
alias gb='git branch'
alias gbranch='git rev-parse --abbrev-ref HEAD' #get current branch name
alias gl="clear ;and git log --graph --pretty=format:'%Cred%h%Creset -%C(yellow)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --abbrev-commit"
alias gt='git tag'
alias grm='git rm'
alias gps='git push'
alias gbi='git bisect'
alias gbg='git bisect good'
alias gbb='git bisect bad'
alias gco='git checkout'
alias gm='git merge'
alias gmt='git mergetool'
alias gdt='git difftool'
alias gp='git pull'
alias gpr='git pull --rebase'
alias gup='git stash ;and git pull --rebase ;and git stash apply'
alias gr='git rebase'
alias gri='git rebase -i'
alias gst='git stash'
alias gsta='git stash apply'
alias gunstage='git reset HEAD'

# checkout pull request
function gcopr
  git fetch origin pull/$argv/head:pr-$argv ;and git checkout pr-$argv;
end

#commit
function gc
  git commit -m "$argv"
end

#cherry-pick
function gcp
  git cherry-pick $argv
end

# add
function ga
  git add $argv
end

# difftool
function gd
  git difftool $argv
end

# publish branch to remote repo
function ggpush
  git push origin (gbranch)
end

# pull branch to local
function ggpull
  git pull origin (gbranch)
end
# open url to github repo
function gopen
  open (_getRemoteBranchUrl)
end

# publish branch to remote repo and open url to it in github
function gpubo
  gpub ;and gopen
end

# delete remote branch
function gunpub
  git push origin :(gbranch)
end

function _getRemote
  git config --get remote.origin.url
end

function _getRemoteBranchUrl
  set remote (_getRemoteUrl)
  set branch (gbranch)
  # remote
  echo $remote/tree/$branch
end

function _getRemoteUrl
  _getRemote | sed -e 's/\(\.git\)*$//g'
end


# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

