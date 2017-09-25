
# Path to Oh My Fish install.

export NVM_DIR="$HOME/.nvm"
. "/usr/local/opt/nvm/nvm.sh"


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
##-----RVM--------
alias rgu='rvm gemset use'
alias irb='pry'
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

function fish_default_key_bindings -d "Default (Emacs-like) key bindings for fish"
    if contains -- -h $argv
        or contains -- --help $argv
        echo "Sorry but this function doesn't support -h or --help"
        return 1
    end

    if not set -q argv[1]
        bind --erase --all # clear earlier bindings, if any
        if test "$fish_key_bindings" != "fish_default_key_bindings"
            # Allow the user to set the variable universally
            set -q fish_key_bindings
            or set -g fish_key_bindings
            # This triggers the handler, which calls us again and ensures the user_key_bindings
            # are executed.
            set fish_key_bindings fish_default_key_bindings
            return
        end
    end

    # These are shell-specific bindings that we share with vi mode.
    __fish_shared_key_bindings $argv
    or return # protect against invalid $argv

    # This is the default binding, i.e. the one used if no other binding matches
    bind $argv "" self-insert
    or exit # protect against invalid $argv

    bind $argv \n execute
    bind $argv \r execute

    bind $argv \ck kill-line

    bind $argv \eOC forward-char
    bind $argv \eOD backward-char
    bind $argv \e\[C forward-char
    bind $argv \e\[D backward-char
    bind $argv -k right forward-char
    bind $argv -k left backward-char

    bind $argv -k dc delete-char
    bind $argv -k backspace backward-delete-char
    bind $argv \x7f backward-delete-char

    # for PuTTY
    # https://github.com/fish-shell/fish-shell/issues/180
    bind $argv \e\[1~ beginning-of-line
    bind $argv \e\[3~ delete-char
    bind $argv \e\[4~ end-of-line

    # OS X SnowLeopard doesn't have these keys. Don't show an annoying error message.
    bind $argv -k home beginning-of-line 2>/dev/null
    bind $argv -k end end-of-line 2>/dev/null
    bind $argv \e\[3\;2~ backward-delete-char # Mavericks Terminal.app shift-ctrl-delete

    bind $argv \ca beginning-of-line
    bind $argv \ce end-of-line
    bind $argv \ch backward-delete-char
    bind $argv \cp up-or-search
    bind $argv \cn down-or-search
    bind $argv \cf forward-char
    bind $argv \cb backward-char
    bind $argv \ct transpose-chars
    bind $argv \et transpose-words
    bind $argv \eu upcase-word

    # This clashes with __fish_list_current_token
    # bind $argv \el downcase-word
    bind $argv \ec capitalize-word
    bind $argv \e\x7f backward-kill-word
    bind $argv \eb backward-word
    bind $argv \ef forward-word
    bind $argv \e\[1\;5C forward-word
    bind $argv \e\[1\;5D backward-word
    bind $argv \e\< beginning-of-buffer
    bind $argv \e\> end-of-buffer

    bind \ed forward-kill-word
    bind \ed kill-word

    # Ignore some known-bad control sequences
    # https://github.com/fish-shell/fish-shell/issues/1917
    bind \e\[I 'begin;end'
    bind \e\[O 'begin;end'

    # term-specific special bindings
    switch "$TERM"
        case 'rxvt*'
            bind $argv \e\[8~ end-of-line
            bind $argv \eOc forward-word
            bind $argv \eOd backward-word
    end
end








# Load Oh My Fish configuration.
source $OMF_PATH/init.fish

status --is-interactive; and source (nodenv init -|psub)
