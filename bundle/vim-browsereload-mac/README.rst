========================
browsereload-mac.vim
========================

Description
--------------------

vim plugin to reflesh your browser. 
this plugin works only MacOS.

Required
--------------------

osascript(AppleScript command)

Installation
--------------------

::

 wget https://github.com/tell-k/vim-browsereload-mac/tarball/master -O browsereload-mac-vim.tar.gz
 tar xvzf browsereload-mac-vim.tar.gz
 mv tell-k-vim-browsereload-mac-* browsereload-mac-vim
 cp -pr ./browsereload-mac-vim/plugin/browsereload-mac.vim ~/.vim/plugin/ 

see also install.sh

Usage
--------------------

browser reload::

 :ChromeReload      //reload "Google Chrome"
 :FirefoxReload     //reload "Firefox"
 :SafariReload      //reload "Safari"
 :OperaReload       //reload "Opera"
 :AllBrowserReload  //reload all browser

start auto reload::

 :ChromeReloadStart  
 :FirefoxReloadStart  
 :SafariReloadStart  
 :OperaReloadStart  
 :AllBrowserReloadStart  

stop auto reload::

 :ChromeReloadStop
 :FirefoxReloadStop
 :SafariReloadStop
 :OperaReloadStop
 :AllBrowserReloadStart


Settings
--------------------

after reload browser. forcus "Terminal" apps.

if you want to change fourcus application, 
change variables "g:returnApps" to your appliation.

::

 "change this variables
 let g:returnApp = "Terminal" 

if you want to stop returnApp, 
change variables "g:returnAppFlag" to 0

::

 "default is 1
 let g:returnAppFlag = 1

if you want old style commad, 
write this setting in your .vimrc

::

 "reload
 command! -bar Cr silent ChromeReload
 command! -bar Fr silent FirefoxReload
 command! -bar Sr silent SafariReload
 command! -bar Or silent OperaReload
 command! -bar Ar silent AllBrowserReload
 "auto reload start
 command! -bar CrStart silent ChromeReloadStart
 command! -bar FrStart silent FirefoxReloadStart
 command! -bar SrStart silent SafariReloadStart
 command! -bar OrStart silent OperaReloadStart
 command! -bar ArStart silent AllBrowserReloadStart
 "auto reload stop
 command! -bar CrStop silent ChromeReloadStop
 command! -bar FrStop silent FirefoxReloadStop
 command! -bar SrStop silent SafariReloadStop
 command! -bar OrStop silent OperaReloadStop
 command! -bar ArStop silent AllBrowserReloadStop
