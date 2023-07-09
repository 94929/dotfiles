#!/usr/bin/env bash

# install packages using brew
brew update
brew tap homebrew/bundle
brew bundle --file=.brewrc

# install pure prompt
npm install --global pure-prompt

# if .mackup.cfg does not exist under the home directory, link one from here
[ ! -f $HOME/.mackup.cfg ] && ln -nfs $PWD/.mackuprc $HOME/.mackup.cfg
mackup restore

# if .gitconfig does not exist under the home directory, link one from here
[ ! -f $HOME/.gitconfig ] && ln -nfs $PWD/.gitrc $HOME/.gitconfig

# if .tmux.conf does not exist under the home directory, link one from here
[ ! -f $HOME/.tmux.conf ] && ln -nfs $PWD/.tmuxrc $HOME/.tmux.conf

# change default shell to zsh, install oh-my-zsh, link .zshrc
chsh -s $(which zsh)
sh -c "$(wget https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh -O -)"
git clone https://github.com/zsh-users/zsh-syntax-highlighting.git ${ZSH_CUSTOM:-~/.oh-my-zsh/custom}/plugins/zsh-syntax-highlighting
git clone git://github.com/zsh-users/zsh-autosuggestions $ZSH_CUSTOM/plugins/zsh-autosuggestions
ln -nfs $PWD/.aliases $HOME/.aliases && ln -nfs $PWD/.exports $HOME/.exports && ln -nfs $PWD/.zshrc $HOME/.zshrc
source $HOME/.zshrc

# source macOS configuration file
source $PWD/.osxrc

# install vimrc
git submodule update --recursive --remote
bash $PWD/vimrc/setup.sh
