## Install homebrew
* follow https://brew.sh/
``` sh
CI=1 /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
echo 'eval "$(/home/linuxbrew/.linuxbrew/bin/brew shellenv)"' >> ~/.bashrc
```

## List of installed packages
* run `brew leaves >| homebrew_ubuntu/brew_pkg.txt` to export name of all installed packages to ./brew_pkg.txt
* `brew install` reinstall these packages to new ubuntu
