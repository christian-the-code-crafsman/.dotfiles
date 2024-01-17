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
