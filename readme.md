
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
