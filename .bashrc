
# If not running interactively, don't do anything
[[ $- != *i* ]] && return


# source aliases
[[ -f ~/.aliases ]] && . ~/.aliases

# source exports
[[ -f ~/.exports ]] && . ~/.exports

# Automatically attach to tmux session on shell open
if [ -z "$TMUX" ] && command -v tmux-sessionizer &>/dev/null && command -v tmux; then
    # automatically attach or create session if custom script & tmux are installed
    tmux-sessionizer "$HOME"
fi

# Open nvim in current dir
bind '"\C-n": "nvim .\n"'

# Run my tmux-sessionizer script on Ctrl+f that opens a folder in a new tmux session
bind '"\C-f": "tmux-sessionizer\n"'

# Open LF Terminal File Manager with Ctrl+o
bind '"\C-o": "lf\n"'

# Unbind for tmux config to use for session and window hopping
bind '"\eh": ""'  # Unbind Alt-h
bind '"\ej": ""'  # Unbind Alt-j
bind '"\ek": ""'  # Unbind Alt-k
bind '"\el": ""'  # Unbind Alt-l


# Google for "Bash Prompt Generator": https://bash-prompt-generator.org/
PS1='\[\e[38;5;134;1m\]\u\[\e[0m\]@\H \[\e[1m\]\w \[\e[38;5;172m\]$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2) \[\e[0m\]\$ '
# PS1='\[\e[38;5;134;1m\]\u\[\e[0m\]@\H \[\e[1;7m\]\w \[\e[27;38;5;172m\]$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2) \[\e[0m\]\$ '
PS1='\[\e[38;5;134;1m\]\u\[\e[0m\]@\H \[\e[1m\]\w \[\e[38;5;172;3m\]$(git branch 2>/dev/null | grep '"'"'*'"'"' | colrm 1 2) \[\e[39;2m\]\$ \[\e[0m\]'

