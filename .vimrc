"--------------------------------------------------------------------
" 覚えるショートカット
"--------------------------------------------------------------------
"#|----- common -----
"#|<F5>   ペーストモードon/off
"#|:Ev    vimrcを編集
"#|:Rv    vimrcを反映
"#|<F1>   一つ右のtabへ
"#|<F2>   一つ左のtabへ
"#|
"#|----- mark -----
"#|ma     aマークを付ける
"#|`a     aマークに移動
"#|:marks 登録したマーク一覧
"#|
"#|----- vim-zencoding -----
"#|div[Ctrl+y,]     <div></div>
"#|div選択[Ctrl+y,] <div></div>



"--------------------------------------------------------------------
" vim-snipmate
"--------------------------------------------------------------------
function! ReloadSnippets( snippets_dir, ft )
    if strlen( a:ft ) == 0
        let filetype = "_"
    else
        let filetype = a:ft
    endif

    call ResetSnippets()
    call GetSnippets( a:snippets_dir, filetype )
endfunction

nmap ,rr :call ReloadSnippets(snippets_dir, &filetype)<CR>


"--------------------------------------------------------------------
" vim-template
"--------------------------------------------------------------------
autocmd User plugin-template-loaded silent! :%!php -n


"--------------------------------------------------------------------
" vim-css-color
"--------------------------------------------------------------------
let g:cssColorVimDoNotMessMyUpdatetime = 1


"--------------------------------------------------------------------
" vim-zencoding
"--------------------------------------------------------------------
let g:user_zen_settings = { 'indentation':'    ' }


"--------------------------------------------------------------------
" vim-pathogen
"--------------------------------------------------------------------
call pathogen#infect()


"---------------------------------------------------------------------
" vim-neocomplcache
"---------------------------------------------------------------------
" enable
let g:neocomplcache_enable_at_startup = 1
" smarrt case有効化。 大文字が入力されるまで大文字小文字の区別を無視する
let g:neocomplcache_enable_smart_case = 1
" camle caseを有効化。大文字を区切りとしたワイルドカードのように振る舞う
let g:neocomplcache_enable_camel_case_completion = 1
" _(アンダーバー)区切りの補完を有効化
let g:neocomplcache_enable_underbar_completion = 1
" シンタックスをキャッシュするときの最小文字長を3に
let g:neocomplcache_min_syntax_length = 3
" neocomplcacheを自動的にロックするバッファ名のパターン
let g:neocomplcache_lock_buffer_name_pattern = '\*ku\*'
" 補完候補の一番先頭を選択状態にする(AutoComplPopと似た動作)
let g:neocomplcache_enable_auto_select = 1

autocmd FileType python set omnifunc=pythoncomplete#Complete
autocmd FileType javascript set omnifunc=javascriptcomplete#CompleteJS
autocmd FileType html set omnifunc=htmlcomplete#CompleteTags
autocmd FileType css set omnifunc=csscomplete#CompleteCSS
autocmd FileType xml set omnifunc=xmlcomplete#CompleteTags
autocmd FileType php set omnifunc=phpcomplete#CompletePHP
autocmd FileType c set omnifunc=ccomplete#Complete
autocmd FileType ruby set omnifunc=rubycomplete#Complete


"---------------------------------------------------------------------
" vim-browsereload-mac
"---------------------------------------------------------------------
"if has('mac') 
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
"endif

"---------------------------------------------------------------------
" vim-js-jquery
"---------------------------------------------------------------------
au BufRead,BufNewFile *.js set ft=javascript syntax=jquery



"-------------------------------------------------------------------------------
" vim-unite
"-------------------------------------------------------------------------------

""" unite.vim
" 入力モードで開始する
let g:unite_enable_start_insert=1
" バッファ一覧
nnoremap <silent> <leader>ub :<C-u>Unite buffer<CR>
" ファイル一覧
nnoremap <silent> <leader>uf :<C-u>UniteWithBufferDir -buffer-name=files file<CR>
" レジスタ一覧
nnoremap <silent> <leader>ur :<C-u>Unite -buffer-name=register register<CR>
" 最近使用したファ ルのヒストリー
nnoremap <silent> <leader>uh :<C-u>Unite file_mru<CR>
" 常用セット
nnoremap <silent> <leader>uu :<C-u>Unite buffer file_mru<CR>
" 全部乗せ
nnoremap <silent> <leader>ua :<C-u>UniteWithBufferDir -buffer-name=files buffer file_mru bookmark file<CR>

" ウィンドウを分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
au FileType unite inoremap <silent> <buffer> <expr> <C-j> unite#do_action('split')
" ウィンドウを縦に分割して開く
au FileType unite nnoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
au FileType unite inoremap <silent> <buffer> <expr> <C-l> unite#do_action('vsplit')
" ESCキーを2回押すと終了する
au FileType unite nnoremap <silent> <buffer> <ESC><ESC> q
au FileType unite inoremap <silent> <buffer> <ESC><ESC> <ESC>q

" 様々なショートカット
call unite#set_substitute_pattern('file', '\$\w\+', '\=eval(submatch(0))', 200)
call unite#set_substitute_pattern('file', '^@@', '\=fnamemodify(expand("#"), ":p:h")."/"', 2)
call unite#set_substitute_pattern('file', '^@', '\=getcwd()."/*"', 1)
call unite#set_substitute_pattern('file', '^;r', '\=$VIMRUNTIME."/"')
call unite#set_substitute_pattern('file', '^\~', escape($HOME, '\'), -2)
call unite#set_substitute_pattern('file', '\\\@<! ', '\\ ', -20)
call unite#set_substitute_pattern('file', '\\ \@!', '/', -30)
if has('win32') || has('win64')
 call unite#set_substitute_pattern('file', '^;p', 'C:/Program Files/')
 call unite#set_substitute_pattern('file', '^;v', '~/vimfiles/')
else
 call unite#set_substitute_pattern('file', '^;v', '~/.vim/')
endif


"---------------------------------------------------------------------
" Configure
"---------------------------------------------------------------------

"------ basic ------
set encoding=utf-8
set nu
syntax on

" スクロール時の余白確保
set scrolloff=5

" スワップファイル作らない
set noswapfile

" コマンドをステータス行に表示
set showcmd

" 現在のモードを表示
set showmode

" OSのクリップボードを使用する
set clipboard+=unnamed

"ヤンクした文字は、システムのクリップボードに入れる"
set clipboard=unnamed

" Ev/Rvでvimrcの編集と反映
command! Ev edit $MYVIMRC   
command! Rv source $MYVIMRC 

" pathogenでftdetectなどをloadさせるために一度ファイルタイプ判定をoff
filetype off
" pathogen.vimによってbundle配下のpluginをpathに加える
call pathogen#runtime_append_all_bundles()
call pathogen#helptags()
set helpfile=$VIMRUNTIME/doc/help.txt
" ファイルタイプ判定をon
filetype plugin indent on

" \pで貼付け
inoremap <Leader>p <ESC>pi
" 挿入モードでCtrl+kを押すとクリップボードの内容を貼り付けられるようにする "
imap <C-K>  <ESC>"*pa


"-------------------------------------------------------------------------------
" ステータスライン StatusLine
"-------------------------------------------------------------------------------
set laststatus=2 " 常にステータスラインを表示

"カーソルが何行目の何列目に置かれているかを表示する
set ruler

"ステータスラインに文字コードと改行文字を表示する
if winwidth(0) >= 120
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %F%=[%{GetB()}]\ %l,%c%V%8P
else
  set statusline=%<[%n]%m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).':'.&ff.']'}%y\ %f%=[%{GetB()}]\ %l,%c%V%8P
endif

"入力モード時、ステータスラインのカラーを変更
augroup InsertHook
autocmd!
autocmd InsertEnter * highlight StatusLine guifg=#ccdc90 guibg=#2E4340
autocmd InsertLeave * highlight StatusLine guifg=#2E4340 guibg=#ccdc90
augroup END

function! GetB()
  let c = matchstr(getline('.'), '.', col('.') - 1)
  let c = iconv(c, &enc, &fenc)
  return String2Hex(c)
endfunction
" help eval-examples
" The function Nr2Hex() returns the Hex string of a number.
func! Nr2Hex(nr)
  let n = a:nr
  let r = ""
  while n
    let r = '0123456789ABCDEF'[n % 16] . r
    let n = n / 16
  endwhile
  return r
endfunc
" The function String2Hex() converts each character in a string to a two
" character Hex string.
func! String2Hex(str)
  let out = ''
  let ix = 0
  while ix < strlen(a:str)
    let out = out . Nr2Hex(char2nr(a:str[ix]))
    let ix = ix + 1
  endwhile
  return out
endfunc

" 高速ターミナル接続を行う
set ttyfast


"###############################

" カーソル行をハイライト
"set cursorline
":hi clear CursorLine
":hi CursorLine gui=underline
"highlight CursorLine ctermbg=grey

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
set backspace=indent,eol,start

"入力補完時に、辞書ファイルも読み込む
set complete=.,w,b,u,t,i,k

"共有のクリップボードを使用する
set clipboard=unnamed

"カレントディレクトリを出力
cmap <c-x> <c-r>=expand('%:p:h')<cr>/
"ファイル名(フルパス)を出力
cmap <c-z> <c-r>=expand('%:p:r')<cr>

" IMEに応じて色を変える
hi CursorIM  guifg=black  guibg=red  gui=NONE  ctermfg=black  ctermbg=white  cterm=reverse

"ペーストモードのON/OFF
set pastetoggle=<F5> 


"-------------------------------------------------------------------------------
" 移動設定 Move
"-------------------------------------------------------------------------------

" CTRL-hjklでウィンドウ移動
nnoremap <C-j> ;<C-w>j
nnoremap <C-k> ;<C-k>j
nnoremap <C-l> ;<C-l>j
nnoremap <C-h> ;<C-h>j

" insert mode での移動
imap  <C-e> <END>
imap  <C-a> <HOME>
" インサートモードでもhjklで移動（Ctrl押すけどね）
imap <C-j> <Down>
imap <C-k> <Up>
imap <C-h> <Left>
imap <C-l> <Right>

" 行末の不要な空白を削除
function! RTrim()
    let s:cursor = getpos(".")
    %s/\s\+$//e
    call setpos(".", s:cursor)
endfunction
autocmd BufWritePre *.php,*.rb,*.js,*.bat call RTrim()

    
"-------------------------------------------------------------------------------
" タブ設定
"-------------------------------------------------------------------------------
" ショートカット
nnoremap <C-t> :tabedit<Return>
nnoremap <C-w> :tabclose<Return>
nnoremap <F2>  :tabn<Return>
nnoremap <F1>  :tabprevious<Return>

set showtabline=4

" タブ色設定
hi TabLine     term=reverse cterm=reverse ctermfg=white ctermbg=black
hi TabLineSel  term=bold cterm=bold ctermfg=5
hi TabLineFill term=reverse cterm=reverse ctermfg=white ctermbg=black


"-------------------------------------------------------------------------------
" fold設定
"-------------------------------------------------------------------------------
" javascript
let javaScript_fold=1


" func, forなど{}を一気にVisual選択
nnoremap vb /{<CR>%v%0

let php_folding=1
au Syntax php set fdm=syntax

let javaScript_fold=1

"--------------------------------------------------------------------
" php lint
"--------------------------------------------------------------------
"set laststatus=2
"set statusline=%<%f\ %m%r%h%w%{'['.(&fenc!=''?&fenc:&enc).']['.&ff.']['.&ft.']'}\ %{b:status}%=%l,%c%V%8P
"au BufEnter * let b:status = ""
"au BufWritePost *.php let b:status=substitute(system("php -l -n " . bufname("%")), '\n', " ", "g")[:70]

"function PHPLint()
  "let result = system( &ft . ' -l -n -d error_reporting=E_ALL ' . bufname(""))
  "echo result
"endfunction
"autocmd BufWritePre *.php call PHPLint()


"--------------------------------------------------------------------
" Titanium設定
"--------------------------------------------------------------------
"function! TitaniumRun()
    "let TitaniumCmd="titanium_builder"
    "for e in [".", "..", "../..", "../../..", "../../../.."]
        "let lsres = system("ls " . e)
        "if lsres =~ ".*tiapp\.xml.*"
            "let result = system(TitaniumCmd . " " . e)
            "echo result
        "endif
    "endfor
"endfunction
"nnoremap <F3> :call TitaniumRun()<Return>

"--------------------------------------------------------------------
" たまにshがうまくセットされないので
"--------------------------------------------------------------------
nnoremap <silent> <leader>sh :set ft=sh<Return>
