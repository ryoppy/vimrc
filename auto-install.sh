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
git clone git://github.com/ryoppy/vimrc.git .

# Get Submodule
git submodule update --init

# phplintのプラグインがplugin/の中にない...これどうしよ...一旦コピーするか
mkdir bundle/vim-phplint/plugin
cp bundle/vim-phplint/phplint.vim bundle/vim-phplint/plugin

# Set .vimrc
ln -sf ~/.vim/.vimrc ~/
ln -sf ~/.vim/.jslintrc ~/

echo "--------------------------------------"
echo "STEP.1 vim-proc compile."
echo "--------------------------------------"
echo "[mac]"
echo "cd bundle/vim-proc/ && make -f make_mac.mak"
echo "[unix]"
echo "cd bundle/vim-proc/ && make -f make_unix.mak"

echo "--------------------------------------"
echo "COMPELTE!"
echo "--------------------------------------"
echo "--- directory ---"
echo " ~/.vim"
echo "--- symbolic link ---"
echo " ~/.vimrc"
echo " ~/.jslintrc"
