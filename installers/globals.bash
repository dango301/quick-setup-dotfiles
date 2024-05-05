# Make global variables accessible by sourcing this file

# Constants
REPO_NAME="quick-setup-dotfiles"
TMP_FILE="/tmp/selection-$REPO_NAME"

# Get the directory path of the script
SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"

FUNCTIONS=(
    "bash"
    "zsh"
    "tmux"
    "nvim"
    "nerd-fonts"
    "zoxide"
    "fzf"
    "lf"
    "alacritty"
    "custom-scripts"
)
DESCRIPTIONS=(
   ".bashrc, .bash_profile"
   "installation, set as default shell, .zshrc, .zprofile, plugins, p10k prompt"
   "installation, tmux.conf, plugins"
   "installation, lua configuration files, plugins"
   "Fira Code Nerd Font"
   "installation"
   "installation"
   "installation, lfrc and icons"
   "installation, alacritty.toml, themes"
   "tmux-sessionizer (placed in ~/bin)"
)



setup_globals() {

    # Mutable globals
    OPTIONS=()
    STATUSES=()
    SELECTED_INDECES=()

    # Fill array with key-value pairs
    for ((i=0; i<${#DESCRIPTIONS[@]}; i++)); do
        OPTIONS+=("${FUNCTIONS[$i]}: ${DESCRIPTIONS[$i]}") # key
        OPTIONS+=("$i") # index as value
    done

    for function in "${FUNCTIONS[@]}"; do
        STATUSES+=("unwanted")
    done
}

update_selection() {
    local selected_options=("$@")
    
    for i in "${selected_options[@]}"; do
        STATUSES[$((i))]="waiting"
        SELECTED_INDECES+=("$((i))")
    done
}

find_function_index() {
    local target="$1"
    
    for index in "${!FUNCTIONS[@]}"; do
        if [[ "${FUNCTIONS[$index]}" == "$target" ]]; then
            echo "$index"
            return 0
        fi
    done

    # If the target value is not found, return -1
    echo "-1"
}

update_status() {
    local index="$1"
    local status="$2"
    STATUSES[$((index))]="$status"
}


