# Cwza Personal Config Files

## Clone This Repository
* `git clone ~/dotfiles`

## For Mac
* Run `xcode-select --install` and install command line tools from macos system update
* Follow instructions under [homebrew_mac/README.md](homebrew_mac/README.md) to install some tools by homebrew
* Install following apps from their official website
    + Karabiner
    + Ghostty
    + VSCode
* Run `bob install stable` and `bob use stable` to install latest neovim
* Run `curl -fsSL https://raw.githubusercontent.com/RivoLink/leaf/main/scripts/install.sh | sh` to install leaf, a markdown terminal viewer
* Run Stow
``` sh
stow karabiner
stow borders
stow ghostty
stow amethyst

stow fd
stow git
stow lazygit
stow nvim
stow opencode
stow ripgrep
stow tmux
stow yazi
stow zsh
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
* Run `bob install stabel` and `bob use stable` to install latest neovim
* Run `curl -fsSL https://raw.githubusercontent.com/RivoLink/leaf/main/scripts/install.sh | sh` to install leaf, a markdown terminal viewer
* Run Stow
``` sh
stow fd
stow git
stow lazygit
stow nvim
stow ripgrep
stow tmux
stow yazi
stow zsh
```

## Set up sshd
* Put your id_rsa and id_rsa.pub file into ~/.ssh/
* Copy id_rsa.pub contents and paste into ~/.ssh/authorized_keys
* Disable ssh password login `sudo nvim /etc/ssh/sshd_config` 
```
PasswordAuthentication no
```

## Tmux
* git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm
* Press prefix + Shift-I in tmux to install plugins

## NeoVim Related Issues
Somehow nvim autocmd after install not worked, so need to manually build these 3 plugins.
* telescope-fzf-native.nvim
    + `cd ~/.local/share/nvim/site/pack/core/opt/telescope-fzf-native.nvim`
    + `make`

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
