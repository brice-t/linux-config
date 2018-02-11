#!/usr/bin/env bash

# dotfiles utility - https://gist.github.com/Jamesits/9bc4adfb1f299380c79e
# Set $DOTFILES to where you want to put your dotfiles.
# then run dotfiles-init someSoftware,
# and it will move all files starting with `.someSoftware` to the correct location
# then link them back,
# Which will produce a directory structure like:
# 
# $ tree -aL 2 ~/Dropbox/Code/config/dotfiles/
# Dropbox/Code/config/dotfiles/
# ├── AndroidStudio
# │   └── .AndroidStudio1.5
# ├── PyCharm
# │   └── .PyCharm50
# ├── X
# │   └── .Xauthority
# ├── android
# │   └── .android
# ├── atom
# │   └── .atom
# ├── bash
# │   ├── .bash_history
# │   ├── .bash_sessions
# │   └── .bashrc
# ├── cordova
# │   └── .cordova
# ├── cups
# │   └── .cups
# ├── docker
# │   └── .docker
# ├── dropbox
# │   └── .dropbox
# ├── gem
# │   └── .gem
# ├── git
# │   ├── .gitconfig
# │   └── .gitignore_global
# ├── gnuradio
# │   └── .gnuradio
# ├── gradle
# │   └── .gradle
# ├── hg
# │   └── .hgignore_global
# ├── ionic
# │   └── .ionic
# ├── iterm2
# │   ├── .iterm2_shell_integration.bash
# │   └── .iterm2_shell_integration.zsh
# ├── matplotlib
# │   └── .matplotlib
# ├── npm
# │   └── .npm
# ├── oh-my-zsh
# │   └── .oh-my-zsh
# ├── oracle_jre
# │   └── .oracle_jre_usage
# ├── python
# │   └── .python_history
# ├── ssh
# │   └── .ssh
# ├── subversion
# │   └── .subversion
# ├── vim
# │   └── .viminfo
# ├── vscode
# │   └── .vscode
# ├── w3m
# │   └── .w3m
# ├── wget
# │   └── .wget-hsts
# └── zsh
#     ├── .zsh-update
#     ├── .zsh_history
#     └── .zshrc
# 

# Where to store your actual config files
export DOTFILES=~/Dropbox/Code/config/dotfiles

# List unlinked dotfiles
dotfiles-count() {
        pushd >/dev/null 2>&1
        cd $HOME
        ls -ald .* | grep -v ^l | tee >(wc -l)
        popd >/dev/null 2>&1
}

# Move and link files named `.something*`
dotfiles-init() {
        pushd >/dev/null 2>&1
        cd $HOME
        ls -ald .$1*;
        mkdir -p $DOTFILES/$1;
        mv .$1* $DOTFILES/$1;
        stow --dir=$DOTFILES --target=$HOME -vv $1
        popd >/dev/null 2>&1
}

# rebuild links - useful when you are recovering settings to a new OS
# run `dotfiles-rebuild *` to rebuild all at once
dotfiles-rebuild() {
        stow --dir=$DOTFILES --target=$HOME -vv $@
}
