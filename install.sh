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

sh casks_with_settings.sh
sh casks_without_settings.sh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"