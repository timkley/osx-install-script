#/bin/bash

# Copy SSH Keys
mkdir $HOME/.ssh
cp -R "./pref/ssh/" "$HOME/.ssh/"

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Update brew to make sure it's up to date
brew update
# Just to be sure everything's ready
brew doctor

# Installing node
brew install node
# Using yarn instead of npm as package manager
brew install yarn
# Install wget as easier nice alternative to CURL
brew install wget
# Install dnsmasq for better resolution of dev-domains
brew install dnsmasq
# copy our dnsmasq-settings over
cp "./pref/dnsmasq/dnsmasq.conf" "/usr/local/etc/"
sudo cp -R "./pref/dnsmasq/resolver" "/etc/"
sudo brew services start dnsmasq
# Install up to date PHP version
brew tap homebrew/php
brew install php71
# Install mysql and set everything up according to https://gist.github.com/nrollr/3f57fc15ded7dddddcc4e82fe137b58e
brew install mysql
brew services start mysql
# Lets take a deep breath while we wait for the service to be really started before trying to set a new password
sleep 1
mysqladmin -u root password 'root'

# For everything not terminal related we install Cask
brew install cask

sh casks_with_settings.sh
sh casks_without_settings.sh

# Install oh-my-zsh
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"# set many OSX settings to my liking
sh osx_settings.sh