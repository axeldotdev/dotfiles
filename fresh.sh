#!/bin/sh

echo "Setting up your Mac..."

# Check for Oh My Zsh and install if we don't have it
if test ! $(which omz); then
  /bin/sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/HEAD/tools/install.sh)"
fi

# Check for Homebrew and install if we don't have it
if test ! $(which brew); then
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> $HOME/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Removes .zshrc from $HOME (if it exists) and symlinks the .zshrc file from the .dotfiles
rm -rf $HOME/.zshrc
ln -s .zshrc $HOME/.zshrc

# Update Homebrew recipes
brew update

# Install all our dependencies with bundle (See Brewfile)
brew tap homebrew/bundle
brew bundle --file ./Brewfile

# Set default MySQL root password and auth type
mysql -u root -e "ALTER USER root@localhost IDENTIFIED WITH mysql_native_password BY 'password'; FLUSH PRIVILEGES;"

# Create a projects directories
mkdir $HOME/Code
mkdir $HOME/Herd

# Set macOS preferences - we will run this last because this will reload the shell
source ./.macos

# Install VSCode extensions
while read extension; do code --install-extension $extension; done < vscode-extensions.txt

# Set VSCode settings
ln -s ./vscode/settings.json $HOME/Library/Application\ Support/Code/User/settings.json

# Set VSCode keybindings
ln -s ./vscode/keybindings.json $HOME/Library/Application\ Support/Code/User/keybindings.json

echo "Your Mac is ready!"
echo "But don't forget to add the Table Plus, Transmit, Intelephense license keys and configure Git with your name and email."
