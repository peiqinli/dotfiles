

export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

ZSH=~/dotfiles/oh-my-zsh

source ~/dotfiles/oh-my-zsh/custom/plugins/antigen.zsh

antigen bundle git
antigen bundle ruby
antigen bundle gem
antigen bundle osx
#antigen bundle command-not-found

# Fish-like bundles
if [[ $ZSH_EVAL_CONTEXT == 'file' ]]; then
antigen bundle zsh-users/fizsh
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle tarruda/zsh-autosuggestions
fi
# Tell antigen that you're done.
antigen apply

ZSH_THEME="powerlevel9k/powerlevel9k"

source  ~/dotfiles/oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme

plugins=(autojump)

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh

### fast edit zshrc file
 ze(){
	 vim ~/dotfiles/zshrc  # edit zshrc file
 }

 # -------------------------------------------------------------------
 # Git
 # -------------------------------------------------------------------
 alias gam="git commit -a -m"

# -------------------------------------------------------------------
# Directory information
# -------------------------------------------------------------------
alias pwdc='pwd && pwd | pbcopy' #find current address and copy it


# -------------------------------------------------------------------
# Directory movement
# -------------------------------------------------------------------
alias up="cd .."
alias bk="cd -"
alias ..='cd ..'
alias ...='cd ../..'
alias ....='cd ../../..'
alias godesk='cd ~/Desktop'

### fast check my local ip address
function myip(){
myip="$(ifconfig | grep 'inet.*netmask.*broadcast')"
lanip="$(echo $myip | awk '{print $2}')"
publicip="$(echo $myip | awk '{print $6}')"
echo 'lan ip '$lanip
echo 'public IP: '$publicip
}
