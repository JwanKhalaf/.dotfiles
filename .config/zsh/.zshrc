# enable powerlevel10k instant prompt.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# path to your oh-my-zsh installation.
export ZSH="/home/j/.config/zsh/.oh-my-zsh"

# set name of the theme to load 
ZSH_THEME="powerlevel10k/powerlevel10k"

# history
HISTSIZE=50000
SAVEHIST=100000
HISTFILE=~/.cache/zsh/.histfile

# plugins
plugins=(git zsh-autosuggestions zsh-syntax-highlighting)

# source oh-my-zsh
source $ZSH/oh-my-zsh.sh

# user configuration
setopt autocd
unsetopt beep
bindkey -v
bindkey "^A" vi-beginning-of-line
bindkey "^E" vi-end-of-line
bindkey "^[^?" backward-kill-word

# load nvm
export NVM_DIR="$HOME/.config/nvm"
[ -s "$NVM_DIR/nvm.sh" ] && \. "$NVM_DIR/nvm.sh"

# preferred editor
export EDITOR='nvim'

# include exports
if [ -f ~/.config/zsh/.exports ]; then
  source ~/.config/zsh/.exports
fi

# include aliases
if [ -f ~/.config/zsh/.aliases ]; then
  source  ~/.config/zsh/.aliases
fi

# To customize prompt, run `p10k configure` or edit ~/.config//zsh//.p10k.zsh.
[[ ! -f ~/.config//zsh//.p10k.zsh ]] || source ~/.config//zsh//.p10k.zsh
