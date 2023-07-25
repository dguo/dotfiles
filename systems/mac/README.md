# Mac

## Set up macOS

* Create an account
    * Set the account (and home folder) name to "dguo"
* Do a system update
* Log in to the App Store
    * Install XCode
    * Install Bitwarden
        * The Homebrew version doesn't support "Enable browser integration"
* Install [Homebrew](https://brew.sh/)
* Go through System Settings
    * Apple Id
        * Set the account picture
    * Notifications
        * Turn off "Allow notifications when the screen is locked"
    * Screen Time
        * Turn it on
    * General
        * Language & Region
            * Change "Date format" to ISO-8601
        * Sharing
            * Set the computer name
    * Control Center
        * Change Bluetooth to "Show in Menu Bar"
        * Change Sound to "Always Show in Menu Bar"
        * Battery
            * Turn on "Show in Control Center"
        * Keyboard Brightness
            * Turn on "Show in Control Center"
        * Menu Bar Only
            * Clock Options
                * Change "Style" to "Analog" if using iStat Menus
            * Change Spotlight to "Don't Show in Menu Bar"
    * Siri & Spotlight
        * Turn off "Ask Siri"
    * Privacy & Security
        * Turn on FileVault
    * Desktop & Dock
        * Dock
            * Make it smaller
        * Change "Double-click a window's title bar to" to "Minimize"
        * Turn on "Minimize windows into application icon"
        * Turn on "Automatically hide and show the Dock"
        * Turn off "Show recent applications in Dock"
        * Hot corners
            * Top left: Mission Control
            * Top right: Desktop
    * Disploys
        * Advanced
            * Battery & Energy
                * Turn off "Slightly dim the display on battery"
        * Night Shift
            * Turn on Night Shift from 9 PM to 5 AM
    * Wallpaper
        * Change it
    * Battery
        * Battery Health
            * Turn off "Optimized Battery Charging"
    * Lock Screen
        * Change "Turn display off on battery when inactive" to "For 2 minutes"
        * Turn on "Show message when locked"
            * Show a phone number to found if lost and found
    * Touch ID & Password
        * Register fingerprints
    * Keyboard
        * Fastest key repeat speed
        * Shortest delay until repeat
        * Keyboard Shortcuts
            * Input Sources
                * Turn off shortcuts for changing the input source
                    * It collides with executing the suggestion in zsh
            * Modifier Keys
                * Make caps lock function as control
                * Swap option and command on external keyboards
        * Text Input
            * Turn on "show Input menu in menu bar"
            * Add Chinese, Simplified
                * Use the "Pinyin - Simplified" input source
    * Mouse
        * Second fastest tracking speed
    * Trackpad
        * Point & Click
            * Second fastest tracking speed
            * Look up & data detectors: tap with three fingers
            * Turn on "Tap to click"
        * Scroll & Zoom
            * Turn off "Natural scrolling"
        * More Gestures
            * Change "Swipe between pages" to "Swipe with Three Fingers"
            * Change "App Exposé" to "Swipe Down with Three Fingers"

### Terminal

```sh
# Set the default shell to the Homebrew zsh
/opt/homebrew/bin/brew install zsh
sudo -s
echo /opt/homebrew/bin/zsh >> /etc/shells
exit
chsh -s /opt/homebrew/bin/zsh

# Clone the dotfiles repo and run its script
mkdir -p code/dguo
cd code/dguo
git clone https://github.com/dguo/dotfiles.git
cd dotfiles
export PATH=/opt/homebrew/bin:$PATH
./configure.sh
```

### Programs

* 1Password
    * Sign in
    * General
        * Clear the keyboard shortcuts for "Show 1Password" and "Autofill"
    * Security
        * Change "Require password" to every 30 days
        * Turn off "Lock on sleep, screensaver, or switching users"
        * Change "Lock after the computer is idle for" to 8 hours
    * Watchtower
        * Turn off "Check for two-factor authentication"
* Bitwarden
    * Sign in
    * Security
        * Turn on "Unlock with Touch ID"
    * App Settings
        * Turn on "Show menu bar icon"
        * Turn on "Minimize to menu bar"
        * Turn on "Close to menu bar"
        * Turn on "Start to menu bar"
        * Turn on "Start automatically on login"
        * Turn on "Allow browser integration"
* iTerm
    * General
        * Preferences
            * Set the path for "Load preferences from a custom folder or URL"
* Docker
    * Sign in
    * General
        * Turn on "Start Docker Desktop when you log in"
    * Resources
        * Set limits
* Anki
    * Sign in
* Firefox
    * Sign in
    * Preferences
        * Set Firefox as the default browser
    * Make the bookmarks toolbar visible (View > Toolbars)
        * Remove the default bookmarks
    * Configure extensions
        * Bitwarden
            * Sign in
            * Security
                * Turn on "Unlock with biometrics"
            * Other
                * Options
                    * Turn off "Ask to add login"
        * Web Scrobbler
            * Sign in to Last.fm
        * Allow some extensions in private windows
            * 1Password
            * Bitwarden
            * PawBlock
            * React Developer Tools
            * uBlock Origin
            * View Image
            * Vimium
        * Set the toolbar
            * Pocket
            * Screenshot
            * Library
            * Developer
            * 1Password
            * Bitwarden
            * uBlock Origin
            * React Developer Tools
            * Session Sync
            * Extensions
        * Log in and pin sites
            * Gmail
            * Google Calendar
            * Google Voice
            * Messenger
            * WhatsApp
            * Leo
            * Todoist
* Google Drive
    * Sign in
    * Turn off "Prompt me to back up devices"
    * Make these folders available offline
        * programs
    * Create a `google-drive-personal` symlink
        * `ln -s Google\ Drive/My\ Drive google-drive-personal`
* Hammerspoon
    * Turn on "Launch Hammerspoon at login"
    * Enable accessiblity
* Duet
    * Allow permissions
    * Sign in
    * Turn off "Open App at Login"
* Notion
    * Sign in
* Spotify
    * Sign in
    * Turn off "See what your friends are playing"
    * Turn off "Open Spotify automatically after you log into the computer"
* Slack
    * Sign in
    * Themes
        * Set the theme to "Light"
* iStat Menus
    * Enter the license
    * Import the settings backup in Google Drive
* Bartender
    * Enter the license
    * General
        * Turn on "Launch Bartender at login"
        * Turn off "Moving the mouse into the menu bar..."
        * Turn on "Show all hidden items if active screen is bigger than"
    * Menu Bar Layout
        * Shown menu bar items
            * Amphetamine
            * Docker
            * iStat time
            * iStat CPU
            * iStat memory
            * iStat battery
            * sound
            * Bluetooth
            * Wi-Fi
* Git
    * Create a [new personal token](https://github.com/settings/tokens/new)
    * Run `git push` in the dotfiles repo and enter the token as the password
* fzf-marks
    * `cd ~/code/dguo/dotfiles && mark dotfiles`
    * `cd ~/Google\ Drive && mark gdrive`
    * `cd ~/code && mark code`
    * `mkdir -p ~/code/scratch && cd ~/code/scratch && mark scratch`
    * `cd ~/Downloads && mark downloads`
    * `cd ~/code/dguo && mark dguo`
* macOS Finder
    * Turn off showing items on the desktop
    * Set new finder windows to show downloads
    * Sidebar
        * AirDrop
        * Applications
        * code
        * dguo
        * Downloads
        * My Drive
        * Google Drive
        * Show all "Locations"
        * iCloud Drive
        * Hide "Tags"
    * Advanced
        * Turn on "Show all filename extensions"
        * Turn off "Show warning before changing an extension"
        * Turn off "Show warning before emptying the trash"
        * Turn on "Remove items from the Trash after 30 days"
* macOS Dock
    * Set show in dock apps
        * Anki
        * Notion
        * Firefox
        * Docker
        * iTerm
        * Postman
        * TablePlus
        * Visual Studio Code
        * Spotify
        * Slack
        * FaceTime
        * Zoom
* TablePlus
    * Import connections
    * Settings
        * General
            * Change "indent with" to "Spaces"
        * Fonts & Colors
            * Use the dark theme
            * Change the font to Source Code Pro for both the editor and data
        * Security
            * Turn on "Unlock Safe Mode with Touch ID"
    * Enter the license
* Zoom
    * Sign in
    * Change settings
        * General
            * Turn on "Use dual monitors"
            * Turn off "Enter full screen when starting or joining a meeting"
            * Turn on "Always show meeting controls"
            * Turn on "Copy invite link when starting a meeting"
            * Turn on "Show meeting timers"
            * Change the reaction skin tone
        * Video
            * Turn on HD
            * Turn on "Always display participant name on their videos"
            * Change "Maximum participants displayed per screen in Gallery View"
              to 49
        * Share Screen
            * Change "Window size when screen sharing" to "Maximize window"
            * Change "When I share directly to a Zoom Room" to "Show all sharing
              options"
        * Recording
            * Switch the recordings location to the Downloads folder
* SSH
    * Run the setup script in Google Drive
* GPG
    * Create a `~/.gnupg` directory and
        [give it the right permissions](https://superuser.com/a/954536/922801)
    * [Import](https://www.phildev.net/pgp/gpg_moving_keys.html) the private and public keys
        * `gpg --import gpg-public-key.asc`
        * `gpg --batch --import gpg-private-key.asc`
    * Add ultimate trust for the key
* Leo
    * Sign in to Slack
    * Install the browser extension
* Notification Center
    * Allow notifications from programs

## Deprovisioning

* Check the downloads folder
* Check Git repos for branches and stashes
* Deregister licenses
* Log out of programs
* Remove GPG keys
* Follow [Apple's instructions](https://support.apple.com/en-us/HT201065)
