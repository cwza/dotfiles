# Cwza Personal Config Files

## Clone This Repository
* `git clone ~/dotfiles`

## For Mac
* Run `xcode-select --install` and install command line tools from macos system update
* Follow instructions under [homebrew/README.md](homebrew/README.md) to install some tools by homebrew
* Install following apps from their official websites
```
Wezterm
VSCode
TreeSitter-Cli
```

## Run Stow
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

## Others
* Follow instructions under [tmux/.config/tmux/README.md](tmux/.config/tmux/README.md) to install tmux plugins
* For Mac use following to update apps
``` sh
brew update
brew upgrade
bob update
:lua vim.pack.update() # run this line in neovim
```
