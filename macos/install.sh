#!/usr/bin/env bash

declare -r DOTFILES_DIR=$( cd $(dirname ${BASH_SOURCE[0]})/.. > /dev/null; pwd -P )

# Contains all config files that go in ~/
declare -r HOMECONFIG_DIR=$DOTFILES_DIR/homeconfig
# Contains all config files that go in ~/.config
declare -r DOTCONFIG_DIR=$DOTFILES_DIR/dotconfig
# Contains all config files that go in ~/Library/Application Support
declare -r APPSUPPORT_DIR=$DOTFILES_DIR/appsupport
# Contains all app/lib installed by this script.
declare -r CONFIG_DIR=$DOTFILES_DIR/config
# Contains scripts for macos install (brew, ...)
declare -r SCRIPTS_DIR=$DOTFILES_DIR/macos/scripts

###############################################################################
#                                 FUNCTIONS                                   #
###############################################################################

symlink_config()
{
  src="$1"
  dst="$2"
    prefix="$3"
    echo "FOLDER $src to $dst"
    for config_file in "$src"/*; do
        if [[ -d $config_file ]]; then
            dst_path="$dst"/"$(basename $config_file)"
        elif [[ -f $config_file ]]; then
            dst_path="$dst"/"$prefix$(basename $config_file)"
        fi
        ln -s "$config_file" "$dst_path"
    done
}


###############################################################################
#                                   MAIN                                      #
###############################################################################

main()
{
  # Applications uses this variable to find their data.
  export ZDOTDIR="$HOME"/.config
  export DOTFILES_DIR

  # Creates dotfiles config folder holding installed app.
  mkdir -p "$CONFIG_DIR"
  # Creates ~/.config holding all configs that can go in XDG user dir.
  mkdir -p "$HOME"/.config

  #
  # Brew installation.
  #
  /usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
  $SCRIPTS_DIR/brew.sh

  #
  # Powerline fonts installation.
  #
  pip install --user git+git://github.com/Lokaltog/powerline --verbose
  brew cask install font-hack-nerd-font

  #
  # ZSH Prezto installation.
  #
  git clone --recursive https://github.com/sorin-ionescu/prezto.git "$CONFIG_DIR/zprezto"

  # Basic config.
  symlink_config "$HOMECONFIG_DIR" "$HOME" "."
  symlink_config "$DOTCONFIG_DIR" "$ZDOTDIR" "."
  # VSCode.
  symlink_config "$APPSUPPORT_DIR/vscode" "$HOME/Library/Application\ Support/Code/User"
}

main

