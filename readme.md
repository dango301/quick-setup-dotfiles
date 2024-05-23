# TODOs

- [ ] reorganize `utilities.bash`:
    - rename to `install-selection.bash` and add the last selection function from main to there
    - create real utilities script for things like logging functions
- [ ] steal logging functions from https://github.com/holman/dotfiles/blob/0e4a15fb1fd789495b74266c4735a6e5eea07415/script/bootstrap
- [ ] write health checks (i.e. test scripts); use `test` command (see man pages)
- [ ] automate creating symlinks and backing up folders if they are already filled
    - use `ln -sv` for symbolic and verbose
    - create functions for this and mv existing folders
    - create backup folder using user's name in `globals.bash` and datetime (for multiple backups in the same minute on failure)
    - simply pass arrays with file paths (from/to) to functions
    - before that, use array for paths to create; if already existing (with files in it!), back up entire folder
    - one function to receive arrays and another to symlink and backup each single file
    - see https://github.com/holman/dotfiles/blob/0e4a15fb1fd789495b74266c4735a6e5eea07415/script/bootstrap
    - for big brain version, see https://github.com/hervenivon/dotfiles/blob/main/bootstrap.sh
- [ ] add options to either overwrite or backup files in the future; see https://github.com/holman/dotfiles/blob/0e4a15fb1fd789495b74266c4735a6e5eea07415/script/bootstrap
- [ ] 

# What to find in this directory

- config files that can easily be copied over to a fresh linux install
- config files have slight variations to work better for ssh access (e.g. different tmux leader key)

# Which config files are included

- .zshrc and profile
- zsh folder in .config that contains all the git repos of the zsh plugins
- tmux config
- alacritty config
- lf config (terminal file manager)
- bashrc and profile (in case zsh is not wanted or used)
- pk10 (zsh prompt) config that was already automatically built by setup wizard
- basic nvim config (work in progress, not yet done)
- custom tmux-sessionizer script

# What needs to be installed manually

- install from apt:
    - alacritty
    - neovim
    - tmux
    - zsh
    - zocxide: only available via `apt install zoxide` for Ubuntu **21.04+**; thus use `curl -sS https://raw.githubusercontent.com/ajeetdsouza/zoxide/main/install.sh | bash` as mentioned above to install on lower versions
    - fzf: available via `sudo apt install fzf`
    - optionally: lf
- nerd font; I like Fira Code
    - download link: https://www.nerdfonts.com/font-downloads
    - move .ttf files to ~/.local/share/fonts
    - optionally also noto-fonts-emoj for emoji support
    - and the noto fonts in general for all language support
- change the default shell to /bin/zsh with `sudo chsh -s /bin/zsh`
