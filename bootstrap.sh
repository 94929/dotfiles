#!/usr/bin/env bash

# install brew if not exists
if test ! $(which brew); then
  ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi

# install packages using brew
brew update
brew tap homebrew/bundle
brew bundle --file=.brewrc

# install pure prompt
npm install --global pure-prompt

# if .gitconfig does not exist under the home directory, link one from here
[ ! -f ~/.gitconfig ] && ln -nfs .gitrc ~/.gitconfig

# if .mackup.cfg does not exist under the home directory, link one from here
[ ! -f ~/.mackup.cfg ] && ln -nfs .mackuprc ~/.mackup.cfg

# change default shell to zsh, install oh-my-zsh, link .zshrc
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
ln -nfs $PWD/.aliases ~/.aliases && ln -nfs $PWD/.exports ~/.exports && ln -nfs $PWD/.zshrc ~/.zshrc
source ~/.zshrc

# source macOS configuration file
source $PWD/.osxrc

# install vimrc
bash $PWD/vimrc/setup.sh
