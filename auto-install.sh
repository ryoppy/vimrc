#!/bin/bash

function throw() {
    echo -e "\033[0;31m$1\033[0;39m"
    exit 1
}

[ -d "$HOME/.vim" ] && throw "~/.vim already exists."
[ -e "$HOME/.vimrc" ] && throw "~/.vimrc already exists."

mkdir -p ~/.vim
cd ~/.vim

# Get Vimrc
git clone git://github.com/ryoppy/vimrc.git

# Set .vimrc
ln -s ./.vimrc ~/

echo "Vim setup complete."
echo " - ~/.vim"
echo " - ~/.vimrc"

