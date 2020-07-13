#/bin/bash

git config --global user.name "Your username"
git config --global user.email you@example.com

# So you can create and track the remote branch by default with doing git push -u
git config --global push.default current

# Deactivate the default branch pager
git config --global pager.branch false

# Set a global excludesfile (which should be copied by the prepare-script)
git config --global core.excludesfile '~/.gitignore_global'