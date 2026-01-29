# Cwza Personal Config Files

## Clone This Repository
* `git clone ~/dotfiles`

## For Mac
* Run `xcode-select --install` and install command line tools from macos system update
* Follow instructions under [homebrew_mac/README.md](homebrew_mac/README.md) to install some tools by homebrew
* Install following apps from their official website
    + karabiner
    + Wezterm
    + VSCode
* Run `bob install nightly` and `bob use nightly` to install latest neovim
* Run Stow
``` sh
stow karabiner
stow borders
stow wezterm

stow fd
stow git
stow lazygit
stow nvim
stow ripgrep
stow tmux
stow zsh
stow yazi
```
* Use multipass to create an ubuntu instance
    + `multipass launch --name [instance name] --cpus 4 --memory 4G --disk 20G`
    + `multipass mount $HOME/multipass_share [instance name]:multipass_share`

## For Ubuntu
* Run followings to install some tools from package manager
``` sh
mkdir -p ~/.local/bin
sudo apt update
sudo apt upgrade
sudo apt install build-essential
sudo apt install zsh
sudo chsh $USER -s $(which zsh)
```
* Follow instructions under [homebrew_ubuntu/README.md](homebrew_ubuntu/README.md) to install some tools by homebrew
* Run `bob install nightly` and `bob use nightly` to install latest neovim
* Run Stow
``` sh
stow fd
stow git
stow lazygit
stow nvim
stow ripgrep
stow tmux
stow zsh
```

## Tmux
* git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
* Press Ctrl-\ Shift-I in tmux to install plugins

## NeoVim Related Issues
Somehow nvim autocmd after install not worked, so need to manually build these 3 plugins.
* telescope-fzf-native.nvim
    + `cd ~/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim`
    + `make`
* LuaSnip
    + `cd ~/.local/share/nvim/site/pack/core/opt/LuaSnip`
    + `make install_jsregexp`
* markdown-preview.nvim
    + `cd ~/.local/share/nvim/site/pack/core/opt/markdown-preview.nvim`
    + `nvim .`
    + `:lua vim.fn["mkdp#util#install"]()`

## Update
* For Mac
``` sh
brew update
brew upgrade
bob update
:lua vim.pack.update()  # run this line in neovim
```
* For Ubuntu
``` sh
sudo apt update
sudo apt upgrade
brew update
brew upgrade
bob update
:lua vim.pack.update()  # run this line in neovim
```
