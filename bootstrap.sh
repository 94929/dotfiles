#!/usr/bin/env bash

# install brew if not exists
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install packages using brew
brew update
brew tap homebrew/bundle
brew bundle --file=$.brewrc

# install pure prompt
npm install --global pure-prompt

# if .gitconfig does not exist under the home directory, link one from here
[ ! -f ~/.gitconfig ] && ln -nfs .gitrc ~/.gitconfig

# change default shell to zsh, install oh-my-zsh, link .zshrc if not exist
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
[ ! -f ~/.zshrc ] && ln -nfs .zshrc ~/.zshrc
source ~/.zshrc

# source macOS configuration file
source .osxrc

