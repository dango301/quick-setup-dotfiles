#!/bin/zsh

# History settings (no history file is created by default)
SAVEHIST=10000  # Save most-recent 10000 lines
HISTSIZE=12000  # Keep most-recent lines in memory; should be at least 20% bigger than $SAVEHIST
HISTFILE="$HOME/.zsh_history"


# source aliases
if [ -f ~/.aliases ]; then
    . ~/.aliases
fi

# source exports
if [ -f ~/.exports ]; then
    . ~/.exports
fi

