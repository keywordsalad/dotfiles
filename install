#!/usr/bin/env bash

echo ">>>>>>>>>>>>>>>>>> CHANGING SHELL TO ZSh >>>>>>>>>>>>>>>>>>"
chsh -s /bin/zsh

echo ">>>>>>>>>>>>>>>>>> OH MY ZSH >>>>>>>>>>>>>>>>>>"
sh -c "$(curl -fsSL https://raw.github.com/ohmyzsh/ohmyzsh/master/tools/install.sh)"

echo ">>>>>>>>>>>>>>>>>> INSTALLING HOMEBREW >>>>>>>>>>>>>>>>>>"
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"

echo ">>>>>>>>>>>>>>>>>> INSTALLING FROM BREWFILE >>>>>>>>>>>>>>>>>>"
brew bundle

echo ">>>>>>>>>>>>>>>>>> SYNCING DOTFILES >>>>>>>>>>>>>>>>>>"
/bin/bash dotsync

