#/bin/bash

brew cask install alfred
cp -R "./pref/Alfred 3" "$HOME/Library/Application Support"

brew cask install tunnelblick
mkdir -p "$HOME/Library/Application Support/Tunnelblick/Configurations"
cp -R "./pref/Tunnelblick/" "$HOME/Library/Application Support/Tunnelblick/Configurations"