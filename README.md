# Cwza Personal Config Files

## Clone This Repository
* `git clone ~/dotfiles`

## For Mac
* Run `xcode-select --install` and install command line tools from macos system update
* Follow instructions under [homebrew/README.md](homebrew/README.md) to install some tools by homebrew
* Install following apps from their official website
    + Wezterm
    + VSCode
* Install following cli tools from their official release page
    + bob
    + tree-sitter
    + put them into `~/.local/bin` and run `chmod +x` for them
* Use multipass to create an ubuntu instance
    + `multipass launch --name [instance name] --cpus 4 --memory 4G --disk 60`
    + `multipass mount $HOME [instance name]:Home`
* Run Stow
``` sh
stow borders
stow fd
stow git
stow nvim
stow ripgrep
stow tmux
stow wezterm
stow zsh
```

## For Ubuntu
* Install followings from package manager
``` sh
mkdir -p ~/.local/bin
sudo apt update
sudo apt upgrade

sudo apt install build-essential
sudo apt install eza
sudo apt install ripgrep
sudo apt install fd-find
ln -s $(which fdfind) ~/.local/bin/fd
sudo apt install bat
ln -s $(which batcat) ~/.local/bin/bat
sudo apt install fzf
sudo apt install git-delta
sudo apt install stow
sudo apt install zoxide
sudo snap install tldr
```
* Install following cli tools from their official release page
    + bob
    + tree-sitter
    + put them into `~/.local/bin` and run `chmod +x` for them
    + lua-language-server
        - put the folder into ~/.local/share
        - run `ln -s ~/.local/share/lua-language-server/bin/lua-language-server ~/.local/bin/lua-language-server`
* Run Stow
``` sh
stow fd
stow git
stow nvim
stow ripgrep
stow tmux
stow zsh
```

## Others
* Follow instructions under [tmux/.config/tmux/README.md](tmux/.config/tmux/README.md) to install tmux plugins
* For Mac use following to update apps
``` sh
brew update
brew upgrade
bob update
:lua vim.pack.update() # run this line in neovim
```
