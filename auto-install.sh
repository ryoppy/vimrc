#!/bin/bash

function throw() {
    echo -e "\033[0;31m$1\033[0;39m"
    exit 1
}

[ -d "$HOME/.vim" ] && throw "~/.vim already exists."
[ -e "$HOME/.vimrc" ] && throw "~/.vimrc already exists."
[ -e "$HOME/.jslintrc" ] && throw "~/.jslintrc already exists."

mkdir -p ~/.vim
cd ~/.vim

# Get Vimrc
git clone git://github.com/ryoppy/vimrc.git

# Set .vimrc
ln -sf ~/vim/.vimrc ~/
ln -sf ~/vim/.jslintrc ~/

echo "Vim setup complete."
echo ""
echo "--- directory ---"
echo " ~/.vim"
echo "--- symbolic link ---"
echo " ~/.vimrc"
echo " ~/.jslintrc"
