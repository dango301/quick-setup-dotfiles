#!/bin/zsh


# Automatically attach to tmux session on shell open
# WARNING: this has to come before the p10k stanza below! See https://github.com/romkatv/powerlevel10k/issues/1203
if [ -z "$TMUX" ]; then # Check if TMUX variable isn't set
    tmux attach || tmux new-session -s "main"
fi


# Enable Powerlevel10k instant prompt. Should stay close to the top of ~/.zshrc.
# Initialization code that may require console input (password prompts, [y/n]
# confirmations, etc.) must go above this block; everything else may go below.
if [[ -r "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh" ]]; then
  source "${XDG_CACHE_HOME:-$HOME/.cache}/p10k-instant-prompt-${(%):-%n}.zsh"
fi


# The following lines were added by compinstall

zstyle ':completion:*' completer _complete _ignored
zstyle ':completion:*' group-name ''
zstyle ':completion:*' matcher-list '+' '+m:{[:lower:]}={[:upper:]}' '+m:{[:lower:][:upper:]}={[:upper:][:lower:]}' '+l:|=* r:|=*'
zstyle ':completion:*' verbose true
zstyle ':completion:*' menu select
zstyle :compinstall filename '/home/dennis/.zshrc'

autoload -Uz compinit
compinit
# End of lines added by compinstall

# colorful listings
zmodload -i zsh/complist
zstyle ':completion:*' list-colors ${(s.:.)LSCOLORS}


# Useful zsh options (read up on all of them via man zshoptions)

zle_higlight=('paste:none') # don't highlight pasted text
unsetopt BEEP # don't beep on error (annoying)
setopt interactive_comments # allow comments in interactive shell
setopt AUTO_LIST # automatically list choices on ambiguous completion
# setopt auto_cd # automatically cd into a directory if it is the only "word" on the command line

# History options
setopt inc_append_history # share history between panes and windows: If this is set, zsh sessions will append their history list to the history file, rather than replace it. Thus, multiple parallel zsh sessions will all have the new entries from their history lists added to the history file; new history lines are added to the $HISTFILE incrementally (as soon as they are entered), rather than waiting until the shell exits. 
setopt hist_ignore_dups # If a new command line being added to the history list duplicates an older one, the older command is removed from the list (even if it is not the previous event).
setopt hist_ignore_space # Remove command lines from the history list when the first character on the line is a space, or when one of the expanded aliases contains a leading space
setopt EXTENDED_HISTORY # puts timestamps in the history; from https://stackoverflow.com/questions/61461898/zsh-command-line-history-with-timestamp

# Globbing
# setopt extended_glob # enable extended globbing READD
# In this case, the extended_glob option is being set. This option enables extended globbing in the Zsh shell. Globbing is a feature in Unix-like operating systems that allows you to use wildcard characters (*, ?, [], etc.) to match filenames or strings.
# Extended globbing enhances this feature by adding additional patterns that you can use. For example, with extended globbing, you can use the (#i) pattern to perform case-insensitive matching, or the (^pattern) pattern to match anything that does not match the given pattern.
# setopt no_nomatch # don't print an error if a glob pattern doesn't match anything READD

# FIX: Set emacs mode; absolutely necessary to disable vim mode
set -o emacs # as opposed to `bindkey -v` for vim mode


# Aliases

# General / Personal use:
alias c="clear"
alias mkdir='mkdir -p' # Create parent directories needed for last directory in path
alias du-here="du -h --max-depth=1 ./ | sort -rh"
# alias ls="lsd" # using lsd package with colors, icons, tree-view, etc.
# alias ll='lsd -al'        # Detailed directory listing
# alias la='lsd -A'          # List all, but exclude . and ..
alias ll='ls -alF' # Detailed directory listing
alias la='ls -A'   # List all, but exclude . and ..
alias n="nvim"

alias cd2="cd .."
alias cd3="cd ../.."
alias cd4="cd ../../.."
alias cd5="cd ../../../.."
alias cd6="cd ../../../../.."

# Confirm before overwriting files
alias cp='cp -i'
alias mv='mv -i'

# Set colored outputs for commands:
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

# Use zoxide as if it were a jump command and fzf (via zi command) as if it were a search command
alias j='z'
alias f='zi'

# for .dotfiles bare git repo that tracks all config files etc.
# alias dotfiles='/usr/bin/git --git-dir=$HOME/.dotfiles/ --work-tree=/'
# alias config="dotfiles"

# Git
alias gs="git status"
alias ga="git add"
alias gc="git commit"
alias gb="git branch"
alias pear="ssh pear@141.83.158.205" # for Robotics Project's NVIDIA Jetson Orin NX on car, potentially REMOVE in the future
alias pear2="ssh pear@141.83.158.160" # for Robotics Project's NVIDIA Jetson Orin NX on car, potentially REMOVE in the future
alias vpn="sudo nmcli --ask con up id Uni-Luebeck-VPN-sslgate" # connect to Uni-Luebeck VPN
alias vpn-close="nmcli con down Uni-Luebeck-VPN-sslgate"

# Tmux
alias ta="tmux a" # attach to previous tmux session
alias tn="tmux new" # create new named tmux session
alias tl="tmux ls" # list all tmux sessions
alias tk="tmux kill-server" # kill tmux server


# Keybindings: general / functional / navigation
# perhaps check out https://stackoverflow.com/a/30899296/11360260 for sth really advanced

# Bind Ctrl+Left and Ctrl+Right to move by word
bindkey '^[[1;5C' forward-word
bindkey '^[[1;5D' backward-word

# Bind Ctrl+Backspace and Ctrl+Delete to delete by word
# bindkey '^H' backward-kill-word
# bindkey '^[[3;5~' kill-word # use Ctrl+w instead as this is the default in most terminal emulators

# Bind Ctrrl+Z to undo and Ctrl+Y to redo
bindkey '^Z' undo
bindkey '^Y' redo

# Bind the key sequence for "Home" to the beginning-of-line action
bindkey '^[[H' beginning-of-line

# Bind the key sequence for "End" to the end-of-line action
bindkey '^[[F' end-of-line

# Bind the key sequence for "Delete" to the delete-char action
bindkey '^[[3~' delete-char


# Keybindings: useful / personal

# Open LF Terminal File Manager with Ctrl+o
# bindkey -s '^o' 'lf\n'

# Run custom tmux-sessionizer script on Alt+f that opens a folder in a new tmux session
bindkey -s '^[f' 'tmux-sessionizer\n'

# Open nvim in current dir
bindkey -s '^n' 'nvim .\n'

# Use Ctrl+Space to accept suggestion too; for zsh-auto-suggestions plugin
bindkey '^ ' autosuggest-accept

# Change style of matches:
HISTORY_SUBSTRING_SEARCH_HIGHLIGHT_FOUND='fg=yellow,bold'

# Unbind for tmux config to use for session and window hopping
bindkey -r '^[[1;3h'  # Unbind Alt-h
bindkey -r '^[[1;3j'  # Unbind Alt-j
bindkey -r '^[[1;3k'  # Unbind Alt-k
bindkey -r '^[[1;3l'  # Unbind Alt-l


# Plugins

# Best way to get a customizable prompt theme: https://github.com/romkatv/powerlevel10k#manual
source ~/.config/zsh/powerlevel10k/powerlevel10k.zsh-theme
# To customize prompt, run `p10k configure` or edit ~/.p10k.zsh.
[[ ! -f ~/.p10k.zsh ]] || source ~/.p10k.zsh

# zoxide for jumping straight to a directory without cd'ing into it
eval "$(zoxide init zsh)"

# zsh-autosuggestions
source ~/.config/zsh/zsh-autosuggestions/zsh-autosuggestions.zsh

# zsh-syntax-highlighting; WARNING: this should be the last plugin to be sourced
source ~/.config/zsh/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh

# zsh-history-substring-search; WARNING: If you want to use zsh-syntax-highlighting along with this script, then make sure that you load it before you load zsh-history-substring-search
source ~/.config/zsh/zsh-history-substring-search/zsh-history-substring-search.zsh

# Rebind up and down arrow keys for history-substring-search plugin
bindkey '^[[A' history-substring-search-up
bindkey '^[[B' history-substring-search-down

