## Install homebrew
* follow https://brew.sh/

## List of installed packages
* run `brew leaves >| homebrew/brew_pkg.txt` to export name of all installed packages to ./brew_pkg.txt
* run `brew list --cask >| homebrew/brew_cask_pkg.txt`
* `brew install` and `brew install --cask` reinstall these packages to new mac
``` sh
bob use nightly
brew services start felixkratz/formulae/borders
```