## Install homebrew
* follow https://brew.sh/
``` sh
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.bashrc
```

## List of installed packages
* run `brew leaves >| homebrew_mac/brew_pkg.txt` to export name of all installed packages to ./brew_pkg.txt
* run `brew list --cask >| homebrew_mac/brew_cask_pkg.txt`
* `brew install` and `brew install --cask` reinstall these packages to new mac
``` sh
brew services start felixkratz/formulae/borders
```
