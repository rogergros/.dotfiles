#!/bin/bash
red=`tput setaf 1`
green=`tput setaf 2`
#yellow=`tput setaf 3`
reset=`tput sgr0`

# Set computer name
current_computer_name=$(scutil --get ComputerName)
echo "Enter computer name [${current_computer_name}]:"
read computer_name

computer_name="${computer_name:=$current_computer_name}"
echo "> ${green}Setting computer name to ${reset}${computer_name}"
sudo scutil --set ComputerName ${computer_name};sudo scutil --set HostName ${computer_name};sudo scutil --set LocalHostName ${computer_name};sudo defaults write /Library/Preferences/SystemConfiguration/com.apple.smb.server NetBIOSName -string ${computer_name}

# OS defaults
# More info: https://macos-defaults.com

echo "> ${green}Setting MacOS defaults${reset}"

## Dock

### Position
defaults write com.apple.dock orientation -string left
### Icon size
defaults write com.apple.dock tilesize -int 40
### Autohide
defaults write com.apple.dock autohide -bool true
### Autohide animation time
defaults write com.apple.dock autohide-time-modifier -float "0.3"
### Autohide delay
defaults write com.apple.Dock autohide-delay -float "0"
### Show recents
defaults write com.apple.dock show-recents -bool true
### Minimize windows into application icon: on
defaults write com.apple.dock minimize-to-application -bool true
### Restart Dock
killall Dock

## Finder

### File extension warning
defaults write com.apple.finder FXEnableExtensionChangeWarning -bool false
### Restart Finder
killall Finder

## Mission control

### Rearrange automatically
defaults write com.apple.dock "mru-spaces" -bool "false"
### Restart Dock
killall Dock

## Mouse & Keyboard

### Mouse speed
defaults write .GlobalPreferences com.apple.mouse.scaling -float 2.5
### Trackpad speed
defaults write .GlobalPreferences com.apple.trackpad.scaling -float 1.5
### Key repeat
defaults write .GlobalPreferences InitialKeyRepeat -int 15
defaults write .GlobalPreferences KeyRepeat -int 2

## Updates

### Update schedule frequency
defaults write com.apple.SoftwareUpdate ScheduleFrequency -int 1

## Security

### Enable FileVault
[ "$(sudo fdesetup status)" != "FileVault is On." ] && sudo fdesetup enable

### Warn if System Integrity Protection is not enabled
[ "$(csrutil status)" != "System Integrity Protection status: enabled." ] && echo "${red}System Integrity Protection not enabled${reset}"

## Screenshot

### Change default screenshot folder

screenshots_folder="~/Pictures/screenshots"
eval full_screenshots_folder=$screenshots_folder
mkdir -p "$full_screenshots_folder"
echo "> ${green}Changing screnshots folder to ${reset}${screenshots_folder}"
defaults write com.apple.screencapture location ~/Pictures/screenshots

## Other

### Show Music song notifications
defaults write com.apple.Music "userWantsPlaybackNotifications" -bool "true" && killall Music &>/dev/null

### Quit printing queue after print
defaults write com.apple.print.PrintingPrefs "Quit When Finished" -bool true

# Disables .DS_Store files for external and network volumes
defaults write com.apple.desktopservices DSDontWriteNetworkStores -bool true;defaults write com.apple.desktopservices DSDontWriteUSBStores -bool true
