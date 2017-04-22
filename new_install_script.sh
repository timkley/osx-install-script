#/bin/bash

# Copy SSH Keys etc
mkdir $HOME/.ssh
cp -R "./pref/ssh/" "$HOME/.ssh/"

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Update brew to make sure it's up to date
brew update
# Just to be sure everything's ready
brew doctor

# Install the things from homebrew which we need
brew install node
# Using yarn instead of npm as package manager
brew install yarn
# Install dnsmasq for better resolution of dev-domains
brew install dnsmasq
cp "./pref/dnsmasq/dnsmasq.conf" "/usr/local/etc/"
sudo cp -R "./pref/dnsmasq/resolver" "/etc/"
sudo brew services start dnsmasq

# For everything not terminal related we install Cask
brew install cask

brew cask install 1password
brew cask install alfred
cp -R "./pref/Alfred 3" "$HOME/Library/Application Support"
brew cask install bettertouchtool
brew cask install cyberduck
brew cask install dropbox
brew cask install firefox
brew cask install flux
brew cask install google-chrome
brew cask install hipchat
brew cask install iterm2
brew cask install phpstorm
mkdir $HOME/Library/Preferences
cp -R "./pref/PhpStorm201*" "$HOME/Library/Preferences"
brew cask install parallels-desktop
brew cask install spotify
brew cask install sequel-pro
brew cask install sublime-text
cp -R "./pref/Sublime Text 3" "$HOME/Library/Application Support"
brew cask install tunnelblick
mkdir -p "$HOME/Library/Application Support/Tunnelblick/Configurations"
cp -R "./pref/Tunnelblick/" "$HOME/Library/Application Support/Tunnelblick/Configurations"

# Better terminal
brew install zsh zsh-completions

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"