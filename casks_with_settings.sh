#/bin/bash

brew cask install alfred
cp -R "./pref/Alfred 3" "$HOME/Library/Application Support"

brew cask install phpstorm
mkdir $HOME/Library/Preferences
cp -R ./pref/PhpStorm201* "$HOME/Library/Preferences"

brew cask install tunnelblick
mkdir -p "$HOME/Library/Application Support/Tunnelblick/Configurations"
cp -R "./pref/Tunnelblick/" "$HOME/Library/Application Support/Tunnelblick/Configurations"