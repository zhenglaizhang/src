#!/usr/bin/env bash

echo "Enabling finder to show hidden files..."
defaults write com.apple.finder AppleShowAllFiles YES
killall Finder

echo "Disabling .DS_Store files creation on network volumes"
defaults write com.apple.desktopservices DSDontWriteNetworkStores true

# Install Homebrew
if [[ $(which brw) ]]; then
    echo "Installing Homebrew..."
else
    echo "Homebrew installed..."
fi

brew update
brew doctor

sleep 20

# Install GNU core utilities 
brew install coreutils

# Install GNU 'find', 'locate', 'updatedb' and 'xargs', g-prefixed
brew install findutils

# Install bash 4
brew install bash

# Install more recent grep
brew tap homebrew/dupes
brew install homebrew/dupes/grep


binaries=(
  graphicsmagick
  webkit2png
  rename
  zopfli
  ffmpeg
  python3
  memcached
  macvim
  mysql
  nmap
  sshfs
  trash
  node
  tree
  ack
  hub
  git
  bash-completion
  hub
  node
  redis
  mongodb
  wget
)

echo "installing binaries..."
brew install ${binaries[@]}

brew cleanup


brew install caskroom/cask/brew-cask
# Apps
apps=(
  alfred
  atom
  firefox
  flux
  google-chrome
  java
  qlmarkdown
  qlprettypatch
  qlstephen
  quicklook-json
  webquicklook
)

# Install apps to /Applications
# Default is: /Users/$user/Applications
echo "installing apps..."
brew cask install ${apps[@]}
