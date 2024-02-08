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
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# Update homebrew recipes
echo "Updating homebrew..."
brew update

echo "Installing Git..."
brew install git
brew link git

echo "Git config"

git config --global user.name "Brad Parbs"
git config --global user.email brad@bradparbs.com


echo "Installing brew git utilities..."
brew install git-extras
brew install legit
brew install git-flow

echo "Installing other brew stuff..."
brew install tree
brew install wget
brew install trash
brew install svn
brew install mackup
brew install node


#@TODO install our custom fonts and stuff

echo "Cleaning up brew"
brew cleanup

echo "Installing homebrew cask"
brew install caskroom/cask/brew-cask

echo "Copying dotfiles from Github"
cd ~
git clone git@github.com:bradp/dotfiles.git .dotfiles
cd .dotfiles
sh symdotfiles

echo "Grunting it up"
npm install -g grunt-cli

#Install Zsh & Oh My Zsh
echo "Installing Oh My ZSH..."
curl -L http://install.ohmyz.sh | sh

echo "Setting up Oh My Zsh theme..."
cd  /Users/bradparbs/.oh-my-zsh/themes
curl https://gist.githubusercontent.com/bradp/a52fffd9cad1cd51edb7/raw/cb46de8e4c77beb7fad38c81dbddf531d9875c78/brad-muse.zsh-theme > brad-muse.zsh-theme

echo "Setting up Zsh plugins..."
cd ~/.oh-my-zsh/custom/plugins
git clone git://github.com/zsh-users/zsh-syntax-highlighting.git

echo "Setting ZSH as shell..."
chsh -s /bin/zsh

# Apps
apps=(
  alfred
  bartender
  bettertouchtool
  cleanmymac
  cloud
  colloquy
  cornerstone
  diffmerge
  dropbox
  filezilla
  firefox
  google-chrome
  harvest
  hipchat
  licecap
  mou
  phpstorm
  private-internet-access
  razer-synapse
  sourcetree
  steam
  spotify
  vagrant
  iterm2
  sublime-text2
  textexpander
  virtualbox
  mailbox
  vlc
  skype
  transmission
  zoomus
  onepassword
  sequel-pro
  chromecast
  qlmarkdown
  qlstephen
  suspicious-package
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps with Cask..."
brew cask install --appdir="/Applications" ${apps[@]}

brew cask alfred link

brew cask cleanup
brew cleanup

echo "Please setup and sync Dropbox, and then run this script again."
read -p "Press [Enter] key after this..."

echo "Restoring setup from Mackup..."
#mackup restore @TODO uncomment

echo "Done!"

#@TODO install vagrant and sites folder
