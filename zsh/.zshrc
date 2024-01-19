# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi

# Set history file and history length to 10000 commands
HISTFILE=~/.histfile
HISTSIZE=10000
SAVEHIST=10000

# Set zsh key bindings to vi mode
bindkey -v

# default autocompletetion?
zstyle :compinstall filename '/home/cgonzalez/.zshrc'
#zstyle ':completetion:*' menu select # arrow key completetion
autoload -Uz compinit
compinit

#enable ssh-agent
eval "$(ssh-agent -s)"
#add github private key
ssh-add ~/.ssh/github

#enable powerlevel10k
source ./powerlevel10k/powerlevel10k.zsh-theme

# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ./.p10k.zsh ]] || source ./.p10k.zsh
