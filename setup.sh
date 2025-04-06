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

#Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
sh -c "$(curl -fsSL https://raw.githubusercontent.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo "Setting up Oh My Zsh theme..."
# cd  /Users/bradparbs/.oh-my-zsh/themes
# curl https://gist.githubusercontent.com/bradp/a52fffd9cad1cd51edb7/raw/cb46de8e4c77beb7fad38c81dbddf531d9875c78/brad-muse.zsh-theme > brad-muse.zsh-theme


echo "Setting up Zsh plugins..."
# cd ~/.oh-my-zsh/custom/plugins
# git clone git://github.com/zsh-users/zsh-syntax-highlighting.git
brew install zsh-autosuggestions
echo "source $(brew --prefix)/share/zsh-autosuggestions/zsh-autosuggestions.zsh" >> ~/.zshrc
brew install zsh-syntax-highlighting 
echo "source $(brew --prefix)/share/zsh-syntax-highlighting/zsh-syntax-highlighting.zsh" >> ~/.zshrc
git clone https://github.com/jirutka/zsh-shift-select.git ~/.oh-my-zsh/custom/plugins/zsh-shift-select

read -p "Add zsh-shift-select to the plugins{} section in your .zshrc-file"

echo "Setting ZSH as shell..."
chsh -s /bin/zsh

# Apps

echo "installing apps with Cask..."

# Apps
apps=(
  google-chrome
  brave-browser
  firefox
  raycast
  spotify
  kindle
  sonos
  audacity
  blackhole-2ch
  calibre
  canva
  vlc
  dropbox
  moom
  obsidian
  logi-options+
  synology-drive
  synology-image-assistant
  1password
  cyberduck
  visual-studio-code
  affinity-designer
  affinity-photo
  whatsapp
  zoom
  microsoft-teams
  moneymoney
  steam
  wiso-steuer-2024
  wiso-steuer-2025
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew cask install --appdir="/Applications" ${apps[@]}

# Manual App installs
echo "Please install the following manually..."
echo "Canon IJ Scan Utility Lite"
echo "The correct MS Office package with your license"
echo "Ausweis App"
echo "Balckmagic Disk Speed Test"
read -p "Press [Enter] key after this..."

brew cleanup

#@TODO Install moom config
echo "Please setup and sync 1Password."
read -p "Press [Enter] key after this..."

echo "Please setup LogiOptions+."
read -p "Press [Enter] key after this..."

echo "Please setup Moom."
read -p "Press [Enter] key after this..."

echo "Please setup and sync Synology Drive."
read -p "Press [Enter] key after this..."

echo "Please setup and sync Dropbox."
read -p "Press [Enter] key after this..."

echo "Please setup WISO Steuer 2024 & 2025."
read -p "Press [Enter] key after this..."

echo "Done!"

#@TODO install vagrant and sites folder
