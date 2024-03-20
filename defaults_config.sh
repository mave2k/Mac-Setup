#!/bin/bash

# Function that asks the user whether to continue
function continue_or_exit() {
    # Prompt the user with a message
    read -p "Continue? (y/yes or any key to exit): " answer

    # Check the response and act accordingly
    case "$answer" in
    [Yy] | [Yy][Ee][Ss])
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
# Spring loading is enabled for Dock items
defaults write com.apple.dock "enable-spring-load-actions-on-all-items" -bool "true"
# Hot corners
# Possible values:
#  0: no-op
#  2: Mission Control
#  3: Show application windows
#  4: Desktop
#  5: Start screen saver
#  6: Disable screen saver
#  7: Dashboard
# 10: Put display to sleep
# 11: Launchpad
# 12: Notification Center
# 13: Lock Screen
defaults write com.apple.dock wvous-bl-corner -int 4
defaults write com.apple.dock wvous-bl-modifier -int 0
defaults write com.apple.dock wvous-br-corner -int 3
defaults write com.apple.dock wvous-br-modifier -int 0
defaults write com.apple.dock wvous-tl-corner -int 13
defaults write com.apple.dock wvous-tl-modifier -int 1048576
defaults write com.apple.dock wvous-tr-corner -int 12
defaults write com.apple.dock wvous-tr-modifier -int 0

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

####################
# Desktop Defaults
echo "Setting Desktop Defaults"
# Keep folders on top when sorting
defaults write com.apple.finder "_FXSortFoldersFirstOnDesktop" -bool "true"
# Show hard disks
defaults write com.apple.finder "ShowHardDrivesOnDesktop" -bool "true"
# Show external disks
defaults write com.apple.finder "ShowExternalHardDrivesOnDesktop" -bool "true"
# Show removable media
defaults write com.apple.finder "ShowRemovableMediaOnDesktop" -bool "true" 
# Show connected servers on desktop
defaults write com.apple.finder "ShowMountedServersOnDesktop" -bool "true"
####################

####################
# Activity Monitor Defaults
echo "Setting Activity Monitor Defaults"
# Enable quick refresh
defaults write com.apple.ActivityMonitor "UpdatePeriod" -int "1"
# Show CPU History in Dock
defaults write com.apple.ActivityMonitor "IconType" -int "6"

killall Activity\ Monitor
####################

####################
# Misc Defaults
echo "Setting Misc Defaults"
# Focus Follows Mouse in Terminal
defaults write com.apple.Terminal "FocusFollowsMouse" -bool "true" && killall Terminal
# Set Function keys to default F-behavior
defaults write NSGlobalDomain com.apple.keyboard.fnState -bool true
#"Allow text selection in Quick Look"
defaults write com.apple.finder QLEnableTextSelection -bool TRUE
#"Check for software updates daily, not just once per week"
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1
#"Expanding the save panel by default"
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint2 -bool true
#"Automatically quit printer app once the print jobs complete"
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true
#"Enabling subpixel font rendering on non-Apple LCDs"
defaults write NSGlobalDomain AppleFontSmoothing -int 2
#"Avoiding the creation of .DS_Store files on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true
#"Disable the sudden motion sensor as its not useful for SSDs"
sudo pmset -a sms 0
# Play feedback when volume is changed: true
/usr/bin/defaults write -g "com.apple.sound.beep.feedback" -int 1

killall Finder
####################