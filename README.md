# dotfiles

Contains my current MacOS dotfiles.

This dotfiles will install:
* git
* python3
* pip
* zprezto


## Installation ##

You first need to clone or download the repository:
```
$ git clone git@github.com:DavidPeicho/dotfiles.git dotfiles
```

Update the file `homeconfig/zshenv` with the absolute path to your dotfiles directory.

You can install the configuration files by hand, or simply run the following command:
```
$ sh macos/install.sh
```

> Be careful, all configuration symlinks will be done toward the `dotfiles' folder,
you are advised to choose the best location for it.

### Terminal Color

The extended color scheme will be downloaded in `dotfiles/_generated/iTerm2-Color-Schemes`.

To import on, go to:

* `Preferences > Profiles > Colors`
* Open the dropdown `Color Presets...`
* Import any schem you like in `iTerm2-Color-Schemes/schemes`
