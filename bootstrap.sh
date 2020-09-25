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

# if .mackup.cfg does not exist under the home directory, link one from here
[ ! -f $HOME/.mackup.cfg ] && ln -nfs $PWD/.mackuprc $HOME/.mackup.cfg
mackup restore

# change default shell to zsh, install oh-my-zsh, link .zshrc
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
ln -nfs $PWD/.aliases $HOME/.aliases && ln -nfs $PWD/.exports $HOME/.exports && ln -nfs $PWD/.zshrc $HOME/.zshrc
source $HOME/.zshrc

# source macOS configuration file
source $PWD/.osxrc

# install vimrc
bash $PWD/vimrc/setup.sh
