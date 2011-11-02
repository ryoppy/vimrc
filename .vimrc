"--------------------------------------------------------------------
" Plugins
"--------------------------------------------------------------------

" *** pathogen
call pathogen#infect()

" *** neocomplcache
let g:neocomplcache_enable_at_startup = 1
autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete

" *** Auto Reload for mac
"change this variables
let g:returnApp = "Terminal"
let g:returnAppFlag = 1

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


"---------------------------------------------------------------------
" Autocomplete
"---------------------------------------------------------------------

" jQuery
au BufRead,BufNewFile *.js set ft=javascript syntax=jquery


"---------------------------------------------------------------------
" Configure
"---------------------------------------------------------------------

"------ basic ------
set encoding=utf-8
set nu
syntax on
filetype plugin indent on

" カーソル行をハイライト
set cursorline
:hi clear CursorLine
:hi CursorLine gui=underline
highlight CursorLine ctermbg=grey

" カレントウィンドウにのみ罫線を引く
augroup cch
  autocmd! cch
  autocmd WinLeave * set nocursorline
  autocmd WinEnter,BufRead * set cursorline
augroup END

"新しい行のインデントを現在行と同じにする
set autoindent

"インクリメンタルサーチを行う
set incsearch

"タブ文字、行末など不可視文字を表示する
set list

"tabが対応する空白の数
set tabstop=4
set softtabstop=4
set shiftwidth=4
set expandtab

"listで表示される文字のフォーマットを指定する
set listchars=tab:>\ ,extends:<

"検索時に大文字を含んでいたら大/小を区別
set smartcase

"新しい行を作ったときに高度な自動インデントを行う
set smartindent

"全角スペースを強調
highlight zenkakuda ctermbg=7
match zenkakuda /　/

"バックスペースでindentを無視 & 改行を越えてバックスペースを許可
"set backspace=indent,eol

"入力補完時に、辞書ファイルも読み込む
set complete=.,w,b,u,t,i,k

"共有のクリップボードを使用する
set clipboard=unnamed

"ペーストモードのON/OFF
set pastetoggle=<F12>

"カレントディレクトリを出力
cmap <c-x> <c-r>=expand('%:p:h')<cr>/
"ファイル名(フルパス)を出力
cmap <c-z> <c-r>=expand('%:p:r')<cr>
