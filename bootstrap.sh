#!/usr/bin/env bash

# set-up pre-requisites
declare -r DOTFILES=$HOME/.dotfiles

# install brew if not exists
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# 
brew update
brew tap homebrew/bundle
brew bundle --file=$HOME/.dotfiles/Brewfile

#
[ ! -f $HOME/.gitconfig ] && ln -nfs $HOME/.dotfiles/.gitconfig $HOME/.gitconfig
[ ! -f $HOME/.gitignore_global ] && ln -nfs $HOME/.dotfiles/.gitignore_global $HOME/.gitignore_global

#
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
[ ! -f $HOME/.zshrc ] && ln -nfs $HOME/dotfiles/.zshrc $HOME/.zshrc
source $HOME/.zshrc

# 
source $HOME/dotfiles/.osx

