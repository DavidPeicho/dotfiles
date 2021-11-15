#!/usr/bin/env bash

brew tap homebrew/cask-fonts
brew tap homebrew/cask

###############################################################################
#                                                                             #
#                                 BINARIES                                    #
#                                                                             #
###############################################################################

brew install git
brew install git-lfs
brew install node
brew install zsh
brew install cmake
brew install python
brew install htop
brew install font-hack-nerd-font --cask

###############################################################################
#                                                                             #
#                               APPLICATIONS                                  #
#                                                                             #
###############################################################################

brew install iterm2 --cask
brew install spotify --cask
brew install visual-studio-code --cask
brew install spectacle --cask

brew cleanup
