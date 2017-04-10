
export PATH="$PATH:$HOME/.rvm/bin" # Add RVM to PATH for scripting

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

