#!/bin/bash

# Function that asks the user whether to continue
function continue_or_exit() {
    # Prompt the user with a message
    read -p "Continue? (y/yes or any key to exit): " answer

    # Check the response and act accordingly
    case "$answer" in
    [Yy][Ee][Ss] | [Yy][Ee][Ss])
        # Script continues
        echo "Continuing..."
        # Return 0 to indicate continuation
        return 0
        ;;
    *)
        # Script exits
        echo "Exiting..."
        # Exit with a non-zero code to signal exit
        exit 1
        ;;
    esac
}

echo "Now Setting the MacOs Defaults"
if ! continue_or_exit; then
    # Handle the case where the user wants to exit
    echo "Exiting based on user choice."
    exit 0
fi

####################
# Finder Defaults
echo "Setting Finder Defaults"
# Show path 
defaults write com.apple.finder _FXShowPosixPathInTitle -bool YES
# Show extensions
defaults write NSGlobalDomain "AppleShowAllExtensions" -bool "true"
# Show hidden files
defaults write com.apple.finder "AppleShowAllFiles" -bool "true"
# Set default view style to "List View"
defaults write com.apple.finder "FXPreferredViewStyle" -string "Nlsv"
# Keep Folders on top when sorting by name
defaults write com.apple.finder "_FXSortFoldersFirst" -bool "true" 
# Set search scope to current folder
defaults write com.apple.finder "FXDefaultSearchScope" -string "SCcf"
# Do not empty bin after 30 days automatically
defaults write com.apple.finder "FXRemoveOldTrashItems" -bool "false"
# Do not show warning when file extension is changed
defaults write com.apple.finder "FXEnableExtensionChangeWarning" -bool "false"
# Home directory is opened in the fileviewer dialog when saving a new document
defaults write NSGlobalDomain "NSDocumentSaveNewDocumentsToCloud" -bool "false"
# Remove the delay when hovering the toolbar title
defaults write NSGlobalDomain "NSToolbarTitleViewRolloverDelay" -float "0"

killall Finder
####################

####################
# Dock Defaults
echo "Setting Dock Defaults"
# Dock icon size 36 pixels
defaults write com.apple.dock "tilesize" -int "36"
# Set dock autohide
defaults write com.apple.dock "autohide" -bool "true"
# Remove Dock autohide animation
defaults write com.apple.dock "autohide-time-modifier" -float "0"
# Do not display recent apps in the Dock
defaults write com.apple.dock "show-recents" -bool "false"
# Set minize effect to "scale"
defaults write com.apple.dock "mineffect" -string "scale"
# Scroll up on a Dock icon to show all Space's opened windows for an app, or open stack
defaults write com.apple.dock "scroll-to-open" -bool "true"

killall Dock
####################

####################
# Screenshots Defaults
echo "Setting Screenshots Defaults"
# Set default screenshot location
defaults write com.apple.screencapture "location" -string "~/Desktop" 
# Save screenshots as png (default)
defaults write com.apple.screencapture "type" -string "png"

killall SystemUIServer
####################

####################
# Safari Defaults
echo "Setting Safari Defaults"
# Show full website URL
defaults write com.apple.Safari "ShowFullURLInSmartSearchField" -bool "true"

killall Safari
####################


