#/bin/bash

# Ask for the administrator password upfront
sudo -v

# Keep-alive: update existing `sudo` time stamp until `.macos` has finished
while true; do sudo -n true; sleep 60; kill -0 "$$" || exit; done 2>/dev/null &

# Copy SSH Keys
mkdir $HOME/.ssh
cp -R "./pref/ssh/" "$HOME/.ssh/"

# Some default folders I want
mkdir $HOME/Code

# Install Homebrew
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
# Update brew to make sure it's up to date
brew update
# Just to be sure everything's ready
brew doctor

# Installing node
brew install node
# Install yarn
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

# install imagemagick
brew install imagemagick

# install zsh
brew install zsh zsh-completions
# install oh-my-zsh manually
git clone git://github.com/robbyrussell/oh-my-zsh.git $HOME/.oh-my-zsh
cp $HOME/.oh-my-zsh/templates/zshrc.zsh-template $HOME/.zshrc
sed -i.bak "s/robbyrussell/agnoster/" $HOME/.zshrc
# Activate the great z plugin
sed -i.bak "s/(git)/(git z)/" $HOME/.zshrc
# Touch the z file to remove an irritating error when first changing a directory
touch $HOME/.z
# Remove the backup file
rm $HOME/.zshrc.bak
echo 'DEFAULT_USER="tk"' >> $HOME/.zshrc
chsh -s /bin/zsh

cp "./pref/shell/alias.sh" "$HOME/.oh-my-zsh/custom/alias.sh"
echo 'source $ZSH/custom/alias.sh' >> $HOME/.zshrc

# Install Source Code Pro powerline font
git clone https://github.com/powerline/fonts.git
sh fonts/install.sh "Source Code Pro"
rm -rf fonts

# For everything not terminal related we install Cask
brew install cask

sh casks_with_settings.sh
sh casks_without_settings.sh

# set many OSX settings to my liking
sh osx_settings.sh

cp -R backup $HOME/backup

# Start Alfred the first time to it can take over the keyboard shortcut
open -a "Alfred 3"