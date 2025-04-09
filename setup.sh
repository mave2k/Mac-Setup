#!/bin/bash

echo "Creating an SSH key for you..."
ssh-keygen -t rsa

echo "Please add this public key to Github \n"
echo "https://github.com/account/ssh \n"
read -p "Press [Enter] key after this..."

echo "Installing xcode-stuff"
xcode-select --install

# Check for Homebrew,
# Install if we don't have it
if test ! $(which brew); then
  echo "Installing homebrew..."
  /bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
  echo 'eval "$(/opt/homebrew/bin/brew shellenv)"' >> ~/.zprofile
  eval "$(/opt/homebrew/bin/brew shellenv)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git..."
brew install git
brew link git

echo "Git config"

git config --global user.name "Daniel Kopenetz"
git config --global user.email mave2k@gmail.com


echo "Installing brew git utilities..."
brew install git-extras
brew install legit
brew install git-flow

echo "Installing other brew stuff..."
brew install tree
brew install wget
brew install node
brew install exiftool
brew install ffmpeg

#@TODO install our custom fonts and stuff

echo "Cleaning up brew"
brew cleanup

# echo "Copying dotfiles from Github"
# cd ~
# git clone git@github.com:bradp/dotfiles.git .dotfiles
# cd .dotfiles
# sh symdotfiles

# echo "Grunting it up"
# npm install -g grunt-cli

# Apps

echo "installing apps with Cask..."

# Apps
apps=(
  1password
  cyberduck
  moneymoney
  visual-studio-code
  affinity-designer
  dropbox
  obsidian
  vlc
  affinity-photo
  firefox
  raycast
  whatsapp
  audacity
  google-chrome
  sonos
  wiso-steuer-2024
  blackhole-2ch
  hammerspoon
  spotify
  wiso-steuer-2025
  brave-browser
  logi-options+
  steam
  zoom
  calibre
  microsoft-auto-update
  synology-drive
  canva
  microsoft-teams
  synology-image-assistant
  postman
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
brew install --cask --appdir="/Applications" ${apps[@]}

brew cleanup

# Manual App installs
echo "Please install from the Mac App Store..."
echo "Ausweis App"
echo "Magnet"
echo "Kindle"
echo "Balckmagic Disk Speed Test"
read -p "Press [Enter] key after this..."

echo "Please install the following manually..."
echo "Canon IJ Scan Utility Lite"
echo "Office 2021 Home & Business"
echo "Davinci Resolve"
read -p "Press [Enter] key after this..."


echo "Please setup and sync 1Password."
read -p "Press [Enter] key after this..."

echo "Please setup LogiOptions+."
read -p "Press [Enter] key after this..."

echo "Please setup Magnet."
read -p "Press [Enter] key after this..."

echo "Please setup and sync Synology Drive."
read -p "Press [Enter] key after this..."

echo "Please setup and sync Dropbox."
read -p "Press [Enter] key after this..."

echo "Now check you login items!"
read -p "Press [Enter] key after this..."

#Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Setting up Zsh plugins..."
brew install zsh-autosuggestions
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
brew install zsh-syntax-highlighting 
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
git clone https://github.com/jirutka/zsh-shift-select.git ~/.oh-my-zsh/custom/plugins/zsh-shift-select

echo "Setting ZSH as shell..."
chsh -s /bin/zsh

echo "Done!"
