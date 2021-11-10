#!/bin/bash -x

# Mac setup script for applying to any Mac to be used at YBPS. Includes BYOD.
# updated 05112020
# START

# Disable Gatekeeper
spctl --master-disable

# Install Munki Tools
installer -pkg /Users/Shared/YBPS\ Installers/munkitools-5.1.1.4112.pkg -target /
# SoftwareRepoURL
/usr/bin/defaults write /Library/Preferences/ManagedInstalls SoftwareRepoURL -string "http://e5836s01sv014.blue.schools.internal:4443"
# ClientIdentifier
/usr/bin/defaults write /Library/Preferences/ManagedInstalls ClientIdentifier -string "ybps_teacher"

# Make the Documents folder in the default user template
mkdir /System/Library/User\ Template/English.lproj/Documents

# userDefaults->hideiCloudSetup
echo 'userDefaults->hideiCloudSetup'
defaults write "/System/Library/User Template/Non_localized/Library/Preferences/com.apple.SetupAssistant" DidSeeCloudSetup -bool TRUE
defaults write "/System/Library/User Template/Non_localized/Library/Preferences/com.apple.SetupAssistant" GestureMovieSeen none

# userDefaults->ShowMountedServersOnDesktop
echo 'userDefaults->ShowMountedServersOnDesktop'
defaults write /System/Library/User\ Template/Non_localized/Library/Preferences/com.apple.Finder ShowMountedServersOnDesktop -bool TRUE

# userDefaults->ShowRemovableMediaOnDesktop
echo 'userDefaults->ShowRemovableMediaOnDesktop'
defaults write /System/Library/User\ Template/Non_localized/Library/Preferences/com.apple.Finder ShowRemovableMediaOnDesktop -bool TRUE

# userDefaults->ShowHardDrivesOnDesktop
echo 'userDefaults->ShowHardDrivesOnDesktop'
defaults write /System/Library/User\ Template/Non_localized/Library/Preferences/com.apple.Finder ShowHardDrivesOnDesktop -bool TRUE

#Set Time Server and TimeZone 
systemsetup -setnetworktimeserver 'e5836s01sv001.blue.schools.internal'
systemsetup -settimezone Australia/Perth

# Expand save and print panels by default
defaults write NSGlobalDomain NSNavPanelExpandedStateForSaveMode -bool true
defaults write NSGlobalDomain PMPrintingExpandedStateForPrint -bool true

touch /private/var/db/.AccessibilityAPIEnabled

# END
