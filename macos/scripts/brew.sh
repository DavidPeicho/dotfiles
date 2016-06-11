#!/usr/bin/env bash

brew tap caskroom/fonts
brew tap caskroom/cask

###############################################################################
#                                                                             #
#                                 BINARIES                                    #
#                                                                             #
###############################################################################

brew install git
brew install node
brew install zsh
brew install cmake
brew install python
sudo easy_install pip
brew install htop

brew install cask

###############################################################################
#                                                                             #
#                               APPLICATIONS                                  #
#                                                                             #
###############################################################################

brew cask install iterm2
brew cask install spotify
brew cask install visual-studio-code
brew cask install spectacle

brew cleanup
