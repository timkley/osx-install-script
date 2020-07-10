#/bin/bash

# Remove all old preferences
rm -rf ./pref
mkdir -p ./pref/{ssh,shell,Tunnelblick}

cp -R "$HOME/.ssh/" "./pref/ssh/"
echo "SSH settings and keys copied."

cp "$HOME/.gitignore_global" "./pref/"

cp "$HOME/.oh-my-zsh/custom/alias.sh" "./pref/shell"
echo "Shell settings copied."

# Tunnelblick configurations
cp -R "$HOME/Library/Application Support/Tunnelblick/Configurations/" "./pref/Tunnelblick"
echo "Tunnelblick settings copied."

# Alfred settings
cp -R "$HOME/Library/Application Support/Alfred 3" "./pref"
echo "Alfred settings copied."
