#!/usr/bin/env bash

declare -r SCRIPTPATH=$( cd $(dirname ${BASH_SOURCE[0]}) > /dev/null; pwd -P )
declare -r DOTFILES_FLDR=$( cd $SCRIPTPATH/.. && pwd )
declare -r CONFIG_FLDR=$DOTFILES_FLDR/config
declare -r HOMECONFIG_FLDR=$DOTFILES_FLDR/homeconfig
declare -r SCRIPTS_FLDR=$SCRIPTPATH/scripts

# Applications uses this variable to find their data.
export DOTFILES_ROOT="$DOTFILES_FLDR"

# Installs brew.
#/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

# Installs all brew dependencies.
#$SCRIPTS_FLDR/brew.sh

# Install powerline fonts.
# pip install --user git+git://github.com/Lokaltog/powerline --verbose
# Install nerd fonts
# brew cask install font-hack-nerd-font

# Install ZSH THEME PREZTO
#git clone --recursive https://github.com/sorin-ionescu/prezto.git "$DOTFILES_FLDR/config/zprezto"

# Creates symlink for every config file in the `config' folder.
for config_file in "$HOMECONFIG_FLDR"/*; do
  dst="${ZDOTDIR:-$HOME}/.$(basename $config_file)"
  ln -s $config_file $dst
done
