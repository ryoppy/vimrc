"--------------------------------------------------------------------
" 覚えるショートカット
"--------------------------------------------------------------------
"#|----- common -----
"#|:Rv    vimrcを反映
"#|Ctrl+a 数字インクリメント
"#|Ctrl+x 数字デクリメント
"#|noremap <SPACE>t :tabedit<Return>
"#|nnoremap <SPACE>w :tabclose<Return>
"\ta trinity all
"\th leftnav taglist
"\tj(F8) src exploer
"\tl NERDTree
"
"Ctrl-w-+ : ウインド拡大
"
"#|
"#|----- mark -----
"#|ma     aマークを付ける
"#|`a     aマークに移動
"#|:marks 登録したマーク一覧
"#|
"#|----- vim-zencoding -----
"#|div[Ctrl+y,]     <div></div>
"#|div選択[Ctrl+y,] <div></div>
"#|
"#|----- vim-align -----
"#|\t=   =で整列
"#|\acom コメントの整列
"#|\tsp  空白で分割して均等に整列
"
"--------------------------------------------------------------------
" 覚えたショートカット
"--------------------------------------------------------------------
"<F1>   一つ右のtabへ
"<F2>   一つ左のtabへ
"<F5>   ペーストモードon/off
":Ev    vimrcを編集
"


"--------------------------------------------------------------------
" ショートカット
"--------------------------------------------------------------------
" Visual選択
map v{ vi{
map v( vi(
map v' vi'
map v" vi"


"--------------------------------------------------------------------
" TODO List
"--------------------------------------------------------------------
noremap <Leader>to :noautocmd vimgrep /TODO/j **/*.rb **/*.js **/*.m **/*.m<CR>:cw<CR>


"--------------------------------------------------------------------
" vim-pathogen
"--------------------------------------------------------------------
call pathogen#infect()


"--------------------------------------------------------------------
" vim-trinity
" vim-srcexpl
"--------------------------------------------------------------------
nmap <leader>ta :TrinityToggleAll<CR>
nmap <leader>th :TrinityToggleTagList<CR>
nmap <leader>tj :TrinityToggleSourceExplorer<CR>
nmap <F8>       :TrinityToggleSourceExplorer<CR>
nmap <leader>tl :TrinityToggleNERDTree<CR>
let g:SrcExpl_updateTagsCmd = "ctags -R --languages=PHP --langmap=PHP:.php.inc --php-types=c+f+d -f ~/live_trunk_web/tags ~/live_trunk_web" 
let g:SrcExpl_updateTagsKey = "<F9>"


"--------------------------------------------------------------------
" vim-memolist
" https://github.com/glidenote/memolist.vim
"--------------------------------------------------------------------
let g:memolist_path = "~/note"
map <Leader>mn  :MemoNew<CR>
map <Leader>ml  :MemoList<CR>
map <Leader>mg  :MemoGrep<CR>


"--------------------------------------------------------------------
" vim-subversion
"--------------------------------------------------------------------
" color調整
" http://d.hatena.ne.jp/kakurasan/20080703
hi DiffAdd    ctermfg=black ctermbg=154
hi DiffChange ctermfg=black ctermbg=159
hi DiffDelete ctermfg=black ctermbg=254
hi DiffText   ctermfg=black ctermbg=225
nmap <leader>crv :VCSRevert<CR>


"--------------------------------------------------------------------
" vim-pathogen
"--------------------------------------------------------------------
call pathogen#infect()


"--------------------------------------------------------------------
" vim-template
"--------------------------------------------------------------------
autocmd User plugin-template-loaded silent! :%!php


"--------------------------------------------------------------------
" vim-toggle
"--------------------------------------------------------------------
imap <C-G> <C-O>:call Toggle()<CR>
nmap <C-G> :call Toggle()<CR>
vmap <C-G> <ESC>:call Toggle()<CR>


"--------------------------------------------------------------------
" vim-template
"--------------------------------------------------------------------
autocmd User plugin-template-loaded silent! :%!php


"--------------------------------------------------------------------
" vim-css-color
"--------------------------------------------------------------------
let g:cssColorVimDoNotMessMyUpdatetime = 1


"--------------------------------------------------------------------
" vim-zencoding
"--------------------------------------------------------------------
let g:user_zen_settings = { 'indentation':'    ' }


"--------------------------------------------------------------------
" vim-surround
"--------------------------------------------------------------------
" 選択Sp = <?php *** ?>
autocmd FileType php,html let b:surround_112 = "<?php \r ?>"

" 選択Sg = _('***')
autocmd FileType php,html let g:surround_103 = "_('\r')"  " 103 = g

" 選択SG = _("***")
autocmd FileType php,html let g:surround_71 = "_(\"\r\")" " 71 = G


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
if match(system("uname"),'Darwin') != -1
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
endif

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

" yank履歴を\gyで扱える
let g:unite_source_history_yank_enable =1  "history/yankの有効化
nnoremap <silent>gy :<C-u>Unite history/yank<CR>

" /Volumeが無視されていたので追記
let g:unite_source_file_mru_ignore_pattern = '\~$\|\.\%(o\|exe\|dll\|bak\|sw[po]\)$\|\%(^\|/\)\.\%(hg\|git\|bzr\|svn\)\%($\|/\)\|^\%(\\\\\|/mnt/\|/media/\)'

" より便利に
nmap <SPACE>h <SPACE>t<leader>uh
nmap <SPACE>f <SPACE>t<leader>uf


"---------------------------------------------------------------------
" Configure
"---------------------------------------------------------------------

"------ basic ------
set encoding=utf-8
set nu
syntax on

" ビープ音off
set noerrorbells

" スクロール時の余白確保
set scrolloff=5

" スワップファイル作らない
set noswapfile

" コマンドをステータス行に表示
set showcmd

" 現在のモードを表示
set showmode

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

" 移動をラクに
map 1k 10k
map 1j 10j
map 1hj 10h
map 1l 10l

map 2k 20k
map 2j 20j
map 2hj 20h
map 2l 20l

map <C-S> :w<CR>
imap <C-S> <ESC>:w<CR>

"改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
    set ambiwidth=double
endif



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

" 検索のハイライト
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

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
set clipboard=unnamed,autoselect

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
nnoremap <SPACE>t :tabedit<Return>
nnoremap <SPACE>w :tabclose<Return>
nnoremap <F2>     :tabn<Return>
nnoremap <F1>     :tabprevious<Return>

set showtabline=4

" タブ色設定
hi TabLine     term=reverse cterm=reverse ctermfg=black ctermbg=white
hi TabLineSel  term=bold cterm=bold ctermfg=5
hi TabLineFill term=reverse cterm=reverse ctermfg=black ctermbg=white

" 個別のタブの表示設定をします
function! GuiTabLabel()
  " タブで表示する文字列の初期化をします
  let l:label = ''

  " タブに含まれるバッファ(ウィンドウ)についての情報をとっておきます。
  let l:bufnrlist = tabpagebuflist(v:lnum)

  " 表示文字列にバッファ名を追加します
  " パスを全部表示させると長いのでファイル名だけを使います 詳しくは help fnamemodify()
  let l:bufname = fnamemodify(bufname(l:bufnrlist[tabpagewinnr(v:lnum) - 1]), ':t')
  " バッファ名がなければ No title としておきます。ここではマルチバイト文字を使わないほうが無難です
  let l:label .= l:bufname == '' ? 'No title' : l:bufname

  " タブ内にウィンドウが複数あるときにはその数を追加します(デフォルトで一応あるので)
  let l:wincount = tabpagewinnr(v:lnum, '$')
  if l:wincount > 1
    let l:label .= '[' . l:wincount . ']'
  endif

  " このタブページに変更のあるバッファがるときには '[+]' を追加します(デフォルトで一応あるので)
  for bufnr in l:bufnrlist
    if getbufvar(bufnr, "&modified")
      let l:label .= '[+]'
      break
    endif
  endfor

  " 表示文字列を返します
  return l:label
endfunction

" guitablabel に上の関数を設定します
" その表示の前に %N というところでタブ番号を表示させています
set guitablabel=%N:\ %{GuiTabLabel()}


"--------------------------------------------------------------------
" js lint
"--------------------------------------------------------------------
if match(system("uname"),'Darwin') != -1
    let $JS_CMD='node'
endif


"--------------------------------------------------------------------
" たまにshがうまくセットされないので
"--------------------------------------------------------------------
nnoremap <silent> <leader>sh :set ft=sh<Return>


"--------------------------------------------------------------------
" /js/test.jsをgfで開けるように
"--------------------------------------------------------------------
autocmd FileType php,html,javascript,css,javascript.titanium setlocal includeexpr=substitute(v:fname,'^\\/','','') | setlocal path+=;/


"--------------------------------------------------------------------
" それぞれの環境ごとの設定 (git管理外)
"--------------------------------------------------------------------
if filereadable(expand('~/.vimrc.local'))
	source ~/.vimrc.local
endif

