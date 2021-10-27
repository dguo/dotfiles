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
* Install the Source Code Pro font directly from
    [GitHub](https://github.com/adobe-fonts/source-code-pro)
    * The Homebrew version needs SVN and uses an [outdated/broken Google Fonts
      version](https://github.com/Homebrew/homebrew-cask-fonts/issues/3972)
    * Add the files to Font Book
* Go through System Preferences
    * Apple Id
        * Set the account picture
        * iCloud
            * Keychain
            * iCloud Drive
            * Find My Mac
            * News
            * Siri
    * Desktop & Screen Saver
        * Set the desktop
        * Set the screen saver
    * Dock & Menu Bar
        * Dock & Menu Bar
            * Make it smaller
            * Change "Double-click a window's title bar" to minimize
            * Turn on "Minimize windows into application icon"
            * Turn on "Automatically hide and show the dock"
            * Turn off "Show recent applications in Dock"
        * Bluetooth
            * Turn on "Show in Menu Bar"
        * Sound
            * Set "Show in Menu Bar" to "always"
        * Clock
            * Change "Time Options" to "Analog"
        * Spotlight
            * Turn off "Show in Menu Bar"
    * Mission Control
        * Hot corners
            * Top left: Mission Control
            * Top right: Desktop
    * Siri
        * Turn off "Enable Ask Siri"
    * Language & Region
        * Add Chinese, Simplified
            * Use the "Pinyin - Simplified" input source
    * Internet Accounts
        * Remove the Game Center account
    * Security & Privacy
        * Require password 5 seconds after sleep or screen saver
        * Turn on FileVault
    * Touch ID
        * Register fingerprints
    * Keyboard
        * Fastest key repeat speed
        * Shortest delay until repeat
        * Make caps lock function as control
        * Swap option and command on external keyboards
    * Trackpad
        * Point & Click
            * Look up & data detectors: tap with three fingers
            * Tap to click: tap with one finger
            * Second fastest tracking speed
        * Scroll & Zoom
            * Turn off natural scroll direction
        * More Gestures
            * Swipe between pages: swipe with three fingers
            * Turn on App Expose
    * Displays
        * Night Shift
            * Turn on Night Shift from 9 PM to 5 AM
    * Battery
        * Battery
            * Turn display off after 5 min.
            * Turn off "Slightly dim the display while on battery power"
            * Turn off "Optimized battery charging"
            * Turn off "Show battery status in menu bar"
        * Power Adapter
            * Turn off "Wake for network access"
    * Sharing
        * Set the computer name

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
        * Turn on "Show item count in sidebar"
    * Security
        * Change "Require Master Password" to every 2 weeks
        * Turn off "Lock on sleep"
        * Turn off "Lock when screen saver is activated"
        * Turn off "Lock after computer is idle"
    * Watchtower
        * Turn off "Check for two-factor authentication"
        * Turn off "Ask before checking for a secure connection"
* Bitwarden
    * Sign in
    * Turn on "Unlock with Touch ID"
    * Turn on "Enable browser integration"
    * Turn on "Enable menu bar icon"
    * Turn on "Close to menu bar"
    * Turn on "Start to menu bar"
    * Turn on "Start automatically on login"
* iTerm
    * Set the path for "Load preferences from a custom folder or URL"
* Docker
    * Sign in
    * Turn on "Start Docker Desktop when you log in"
    * Set resource limits
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
            * Turn on "Unlock with biometrics"
            * Turn on Options > "Disable Add Login Notification"
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
        * Pin items to the overflow menu, except for these
            * Pocket
            * Developer
            * Library
            * Screenshot
            * Session Sync
            * 1Password
            * Bitwarden
            * uBlock Origin
            * Picture Paint
            * React Developer Tools
            * PawBlock
* Google Drive
    * Sign in
    * Turn off "Prompt me to back up devices"
    * Make these folders available offline
        * programs
* Hammerspoon
    * Turn on "Launch Hammerspoon at login"
* Duet
    * Allow accessibility permissions
    * Turn off "Open app at login"
* Notion
    * Sign in
* Spotify
    * Sign in
    * Turn off "See what your friends are playing"
* Slack
    * Sign in
    * Set the theme to "Light"
* Git
    * Create a [new personal token](https://github.com/settings/tokens/new)
    * Run `git push` in the dotfiles repo and enter the token as the password
* Dropbox
    * Sign in
    * Turn on selective sync
    * Disable camera uploads
* iStat Menus
    * Enter the license
    * Import the settings backup in Google Drive
* Zoom
    * Sign in
    * Change settings
        * General
            * Change the reaction skin tone
            * Turn on "Copy invite link when starting a meeting"
        * Video
            * Turn on HD
            * Turn on "Always display participant name on their videos"
        * Recording
            * Switch the recordings location to the Downloads folder
* TablePlus
    * Enter the license
    * Import connections
* Toggl
    * Sign in
    * Turn off idle detection
    * Turn off reminders
* macOS Dock
    * Set show in dock apps
        * Anki
        * Todoist
        * Notion
        * Firefox
        * Docker
        * iTerm
        * Postman
        * TablePlus
        * Visual Studio Code
        * OBS
        * Spotify
        * Slack
        * Zoom
        * Toggl
* macOS Finder
    * Turn off showing external disks on the desktop
    * Set new finder windows to show downloads
    * Set sidebar items
        * AirDrop
        * Applications
        * code
        * Downloads
        * dguo
        * Google Drive
        * Dropbox
        * iCloud Drive
        * External disks
        * CDs, DVDs, and iOS Devices
        * Bonjour computers
        * Connected servers
    * Turn on "Show all filename extensions"
    * Turn off "Show warning before changing an extension"
    * Turn off "Show warning before emptying the trash"
    * Turn on "Remove items from the Trash after 30 days"
* fzf-marks
    * `cd ~/code/dguo/dotfiles && mark dotfiles`
    * `cd ~/Google\ Drive && mark gdrive`
    * `cd ~/code && mark code`
    * `mkdir -p ~/code/scratch && cd ~/code/scratch && mark scratch`
    * `cd ~/Downloads && mark downloads`
    * `cd ~/code/dguo && mark dguo`
* GPG
    * Create a `~/.gnupg` directory and
        [give it the right permissions](https://superuser.com/a/954536/922801)
    * [Import](https://www.phildev.net/pgp/gpg_moving_keys.html) the private and public keys
    * Add ultimate trust for the key
* Leo
    * Follow Notion instructions
* SSH
    * Run the setup script in Google Drive
