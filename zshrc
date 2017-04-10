
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

source ~/dotfiles/oh-my-zsh/custom/plugins/antigen.zsh

antigen bundle git
antigen bundle ruby
antigen bundle gem
antigen bundle osx
antigen bundle zsh-users/zsh-syntax-highlighting
antigen bundle zsh-users/zsh-history-substring-search
antigen bundle tarruda/zsh-autosuggestions

ZSH_THEME="powerlevel9k/powerlevel9k"

source  ~/dotfiles/oh-my-zsh/custom/themes/powerlevel9k/powerlevel9k.zsh-theme

plugins=(git ruby autojump zsh-autosuggestions)

[[ -s `brew --prefix`/etc/autojump.sh ]] && . `brew --prefix`/etc/autojump.sh
