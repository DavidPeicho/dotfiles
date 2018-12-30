#!/usr/bin/env bash

declare -r SCRIPTPATH=$( cd $(dirname ${BASH_SOURCE[0]}) > /dev/null; pwd -P )
declare -r DOTFILES_DIR=$( cd $SCRIPTPATH/.. && pwd )
declare -r HOMECONFIG_DIR=$DOTFILES_DIR/homeconfig
declare -r DOTCONFIG_DIR=$DOTFILES_DIR/dotconfig
declare -r APPSUPPORT_DIR=$DOTFILES_DIR/appsupport
declare -r SCRIPTS_FLDR=$SCRIPTPATH/scripts

symlink_config()
{
    src="$1"
    dst="$2"
    for config_file in "$src"/*; do
        if [[ -d $config_file ]]; then
            dst_path="$dst"/"$(basename $config_file)"
        elif [[ -f $config_file ]]; then
            dst_path="$dst"/."$(basename $config_file)"
        fi
        ln -s "$config_file" "$dst_path"
    done
}

# Applications uses this variable to find their data.
export ZDOTDIR="$HOME"/.config
export DOTFILES_DIR="$DOTFILES_FLDR"

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
# symlink_config "$HOMECONFIG_DIR" "$HOME"
# symlink_config "$DOTCONFIG_DIR" "$ZDOTDIR"

###
# Manual symlink
###

# VSCODE
ln -s "$APPSUPPORT/vscode/keybindings.json" $HOME/Library/Application\ Support/Code/User/keybindings.json
ln -s "$APPSUPPORT/vscode/settings.json" $HOME/Library/Application\ Support/Code/User/settings.json

