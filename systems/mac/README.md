# Mac

## Setup

* Create an account
    * Set the account (and home folder) name to "dguo"
    * Set a dark theme
* Do a system update
* Remove everything from the dock
* Sign in with Apple ID
    * Only let these apps use iCloud
        * iCloud Drive
        * Keychain
        * Find My Mac
        * News
    * Remove Game Center account in Internet Accounts
* Log in to the App Store and install XCode
* Install [Homebrew](https://brew.sh/)
* Run the initial setup through the terminal
* Set up programs and system preferences

### Terminal

```sh
# Set the default shell to the Homebrew zsh
brew install zsh
sudo -s
echo /usr/local/bin/zsh >> /etc/shells
exit
chsh -s /usr/local/bin/zsh

# Clone the dotfiles repo and run its script
mkdir -p code/dguo
cd code/dguo
git clone https://github.com/dguo/dotfiles.git
cd dotfiles
./configure.sh
```

### Programs

* Git
    * Create a [new personal token](https://github.com/settings/tokens/new)
    * Run `git push` in the dotfiles repo and enter the token as the password
* iTerm
    * Set the path for "Load preferences from a custom folder or URL"
* Rectangle
    * Give accessibility permission
    * Choose "Spectacle" shortcuts and behavior
    * Turn on "Launch on login"
    * Turn off "Snap windows by dragging"
    * Turn off "Cycle across displays on repeated left or right commands"
    * Turn on "Check for updates automatically"
* 1Password
    * Sign in
    * Turn off "Open 1Password in the background when you log in"
    * Don't enable the extension helper when prompted
* Bitwarden
    * Sign in
* Docker
    * Sign in
    * Set resource limits
* Dropbox
    * Sign in
    * Turn on selective sync
    * Disable camera uploads
* Firefox
    * Sign in
    * Go through preferences
        * Set Firefox as the default browser
    * Make the bookmarks toolbar visible (View > Toolbars)
    * Configure extensions
        * 1Password
            * Sign in
            * Set "Lock after system is idle for" to 900 minutes
            * Turn off "Lock when devices goes to sleep"
        * Bitwarden
            * Sign in
            * Turn on "Disable Add Login Notification"
        * Web Scrobbler
            * Sign in to Last.fm
            * Turn off "Use now playing notifications"
            * Turn on "Disable Google Analytics"
            * Turn off "Scrobble podcasts"
        * Allow some extensions in private windows
            * 1Password
            * Bitwarden
            * Google search link fix
            * HTTPS Everywhere
            * PawBlock
            * Picture Paint
            * React Developer Tools
            * uBlock Origin
            * View Image
            * Vimium
        * Pin items to the overflow menu, except for these
            * Developer
            * Library
            * Picture Paint
            * PawBlock
            * 1Password
            * Bitwarden
            * Session Sync
            * uBlock Origin
            * React Developer Tools
* Google Backup and Sync
    * Sign in
    * Don't backup macOS folders
    * Change photo and video upload size to high quality
    * Turn on selective sync
* Hammerspoon
    * Turn on "Launch Hammerspoon at login"
* Notion
    * Sign in
* iStat Menus
    * Enter the license
    * Import the settings backup in Google Drive
* Anki
    * Sign in
* Duet
    * Allow accessibility permissions
    * Turn off "Open app at login"
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
* Spotify
    * Sign in
    * Hide friend activity sidebar
    * Limit the cache size
* TablePlus
    * Enter the license
    * Import connections
* Toggl
    * Sign in
    * Turn off idle detection
    * Turn off reminders
* Slack
    * Sign in
    * Set the theme to "Light"
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
* macOS Settings
    * General
        * Turn on dark mode
   * Desktop & Screen Saver
        * Desktop
            * Dynamic
        * Screen Saver
            * "Ken Burns"
    * Dock
        * Make it smaller
        * Turn on "Minimize windows into application icon"
        * Change "Double-click a window's title bar" to minimize
        * Turn on "Automatically hide and show the dock"
        * Turn off "Show recent applications in Dock"
    * Mission Control
        * Hot corners
            * Top left: Mission Control
            * Top right: Desktop
    * Siri
        * Turn off "Enable Ask Siri"
    * Language & Region
        * Add Chinese, Simplified
            * Use the "Pinyin - Simplified" input source
    * Internet accounts
        * iCloud accounts (for 2FA)
    * Touch ID
        * Register fingerprints
    * Users & Groups
        * Login items
            * Hammerspoon
            * Backup and Sync
    * Security & Privacy
        * Require password 5 seconds after sleep or screen saver
        * Turn on FileVault
    * Bluetooth
        * Turn on "Show Bluetooth in menu bar"
    * Sound
        * Turn on "Show volume in menu bar"
    * Keyboard
        * Fastest key repeat speed
        * Shortest delay until repeat
        * Change Touch Bar to show "Expanded Control Strip"
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
        * Turn off True Tone
        * Turn off "show mirroring options in the menu bar when available"
        * Night Shift
            * Turn on Night Shift from 9 PM to 5 AM
    * Energy Saver
        * Battery
            * Turn display off after 5 min.
            * Turn off "Slightly dim the display while on battery power"
        * Turn off "Show battery status in menu bar"
    * Date & Time
        * Turn off "Show date and time in menu bar"
    * Sharing
        * Set computer name
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
