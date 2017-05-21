#/bin/bash

# Remove all old preferences
rm -rf ./pref
mkdir -p ./pref/{ssh,shell,Tunnelblick,dnsmasq}

cp -R "$HOME/.ssh/" "./pref/ssh/"
echo "SSH settings and keys copied."

cp "$HOME/.oh-my-zsh/custom/alias.sh" "./pref/shell"
echo "Shell settings copied."

# PhpStorm settings (version needs to be adjusted as needed)
phpstorm="PhpStorm2017.1"

cp -R "$HOME/Library/Preferences/$phpstorm" "./pref"
# Remove project specific files
rm -R "./pref/$phpstorm/tasks"
# Remove weird javascript stuff
rm -R "./pref/$phpstorm/javascript"
# Remove recent directories (since this will be new)
rm "./pref/$phpstorm/options/recentProjectDirectories.xml"
echo "$phpstorm settings copied."

# Tunnelblick configurations
cp -R "$HOME/Library/Application Support/Tunnelblick/Configurations/" "./pref/Tunnelblick"
echo "Tunnelblick settings copied."

# Alfred settings
cp -R "$HOME/Library/Application Support/Alfred 3" "./pref"
echo "Alfred settings copied."

# dnsmasq
# see: https://passingcuriosity.com/2013/dnsmasq-dev-osx/
cp "/usr/local/etc/dnsmasq.conf" "./pref/dnsmasq/"
cp -R "/etc/resolver" "./pref/dnsmasq"
echo "dnsmasq settings copied."