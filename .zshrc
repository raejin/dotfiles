#
# Executes commands at the start of an interactive session.
#
# Authors:
#   Sorin Ionescu <sorin.ionescu@gmail.com>
#

# Source Prezto.
if [[ -s "${ZDOTDIR:-$HOME}/.zprezto/init.zsh" ]]; then
  source "${ZDOTDIR:-$HOME}/.zprezto/init.zsh"
fi

# Customize to your needs...
if [ -d "/home/rae_liu/.gem/ruby/1.9.1/bin" ] ; then
      PATH="/home/rae_liu/tmux:/home/rae_liu/.gem/ruby/1.9.1/bin:$PATH"
fi

source /etc/airlab_env

# Tweak Ruby GC env vars to reduce GC cycles (makes Ruby faster)

export RUBY_GC_MALLOC_LIMIT=59000000
export RUBY_HEAP_FREE_MIN=100000
export RUBY_HEAP_MIN_SLOTS=600000

# Initialize Rbenv if it's installed
if [ -d "$HOME/.rbenv/bin" ]; then
export PATH="$HOME/.rbenv/bin:$PATH"
eval "$(rbenv init -)"
fi

export PATH="$HOME/.linuxbrew/bin:$PATH"
export PATH="$HOME/.nodenv/versions/12.16.2/bin:$PATH"

# why would you type 'cd dir' if you could just type 'dir'?
setopt AUTO_CD

# 10 second wait if you do something that will delete everything.  I wish I'd had this before...
setopt RM_STAR_WAIT

[[ $TMUX = "" ]] && export TERM="xterm-256color"
#export EDITOR="subl -n -w"
#export NVM_DIR="$HOME/.nvm"
#  . "/usr/local/opt/nvm/nvm.sh"

alias sc="npm run -s sanity-check --"
alias rg="rg --color=always -p"
#alias tmux="TERM=xterm-256color tmux -2"

# for fixing color to the right of cursor issue regarding autosuggestion
export ZSH_AUTOSUGGEST_HIGHLIGHT_STYLE="fg=8"
export GREP_COLOR='1;38;5;232;48;5;229' # https://askubuntu.com/questions/1042234/modifying-the-color-of-grep
alias gam="gc --amend"
alias bi="bundle install"
alias b="bundle exec"

bindkey "^[f" vi-forward-blank-word
bindkey "^[b" vi-backward-blank-word

[ -f ~/.fzf.zsh ] && source ~/.fzf.zsh
alias nvim="~/nvim.appimage"
export FZF_TMUX=1
alias vim="nvim"
alias removeMetroCache="rm -rf /tmp/metro-cache /tmp/haste-map-metro*"

source <(kubectl completion zsh)

