vimrc
======================================

Vim install
----

vim 7.4 +lua

### Linux

```
# Lua jit install.
git clone http://luajit.org/git/luajit-2.0.git luajit 
make
sudo make install
```

```
# vim install
wget ftp://ftp.vim.org/pub/vim/unix/vim-7.4.tar.bz2
./configure --enable-multibyte --with-features=huge --disable-selinux \
        --prefix=/usr/local \
        --enable-luainterp=yes --with-luajit --with-lua-prefix=/usr/local 
make
sudo make install
```

```
# add .zshrc
export LD_LIBRARY_PATH=$LD_LIBRARY_PATH:/usr/local/lib
```

### mac

```
brew install vim --with-lua
```

INSTALL
----

Use curl (for Mac OS X):

     curl -o - https://raw.github.com/ryoppy/vimrc/master/auto-install.sh | sh

or wget (for most UNIX platforms):

     wget -O - https://raw.github.com/ryoppy/vimrc/master/auto-install.sh | sh

