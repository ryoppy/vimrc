"--------------------------------------------------------------------
" vim-neobundle
"--------------------------------------------------------------------
if has('vim_starting')
  set nocompatible
  set runtimepath+=~/.vim/bundle/neobundle.vim/
endif
call neobundle#begin(expand('~/.vim/bundle/'))

NeoBundleFetch 'Shougo/neobundle.vim'

" Plugins
NeoBundle 'Shougo/unite.vim'
NeoBundle 'Shougo/neomru.vim'     " uniteでhistory開くのに必要
NeoBundle 'Shougo/neocomplete'    " 補完
NeoBundle 'Shougo/neosnippet'
NeoBundle 'Align'
NeoBundle 'tpope/vim-surround'
NeoBundle 'taku-o/vim-toggle'
NeoBundle 'itchyny/lightline.vim' " Statusバーを見やすく
NeoBundle 'tpope/vim-fugitive'    " Git
" >Languages
NeoBundle 'vim-coffee-script'
NeoBundle 'vim-stylus'

call neobundle#end()
filetype plugin indent on
NeoBundleCheck


"--------------------------------------------------------------------
" vim-lightline
"--------------------------------------------------------------------
" export TERM=xterm-256color
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ }


"--------------------------------------------------------------------
" vim-toggle
"--------------------------------------------------------------------
imap <C-G> <C-O>:call Toggle()<CR>
nmap <C-G> :call Toggle()<CR>
vmap <C-G> <ESC>:call Toggle()<CR>

let g:neosnippet#snippets_directory = '~/.vim/snippets' 
" Plugin key-mappings.
imap <C-k>     <Plug>(neosnippet_expand_or_jump)
smap <C-k>     <Plug>(neosnippet_expand_or_jump)
xmap <C-k>     <Plug>(neosnippet_expand_target)

" SuperTab like snippets behavior.
imap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: pumvisible() ? "\<C-n>" : "\<TAB>"
smap <expr><TAB> neosnippet#expandable_or_jumpable() ?
\ "\<Plug>(neosnippet_expand_or_jump)"
\: "\<TAB>"

" For snippet_complete marker.
if has('conceal')
  set conceallevel=2 concealcursor=i
endif

"---------------------------------------------------------------------
" vim-neocomplte
"---------------------------------------------------------------------
let g:acp_enableAtStartup = 0
let g:neocomplete#enable_at_startup = 1
let g:neocomplete#enable_smart_case = 1
let g:neocomplete#sources#syntax#min_keyword_length = 2
let g:neocomplete#lock_buffer_name_pattern = '\*ku\*'

" Define dictionary.
let g:neocomplete#sources#dictionary#dictionaries = {
    \ 'default' : ''
    \ }

" Define keyword.
if !exists('g:neocomplete#keyword_patterns')
  let g:neocomplete#keyword_patterns = {}
endif
let g:neocomplete#keyword_patterns['default'] = '\h\w*'

" Plugin key-mappings.
inoremap <expr><C-g>     neocomplete#undo_completion()
inoremap <expr><C-l>     neocomplete#complete_common_string()

" Recommended key-mappings.
" <CR>: close popup and save indent.
inoremap <silent> <CR> <C-r>=<SID>my_cr_function()<CR>
function! s:my_cr_function()
  return neocomplete#close_popup() . "\<CR>"
endfunction
" <TAB>: completion.
inoremap <expr><TAB>  pumvisible() ? "\<C-n>" : "\<TAB>"
" <C-h>, <BS>: close popup and delete backword char.
inoremap <expr><C-h> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><BS> neocomplete#smart_close_popup()."\<C-h>"
inoremap <expr><C-y>  neocomplete#close_popup()
inoremap <expr><C-e>  neocomplete#cancel_popup()

" Enable omni completion.
autocmd FileType css setlocal omnifunc=csscomplete#CompleteCSS
autocmd FileType html,markdown setlocal omnifunc=htmlcomplete#CompleteTags
autocmd FileType javascript setlocal omnifunc=javascriptcomplete#CompleteJS

" Enable heavy omni completion.
if !exists('g:neocomplete#sources#omni#input_patterns')
  let g:neocomplete#sources#omni#input_patterns = {}
endif
"let g:neocomplete#sources#omni#input_patterns.php = '[^. \t]->\h\w*\|\h\w*::'
"let g:neocomplete#sources#omni#input_patterns.perl = '\h\w*->\h\w*\|\h\w*::'


"---------------------------------------------------------------------
" vim-unite:
"---------------------------------------------------------------------
nnoremap    [unite]   <Nop>
nmap    <leader>u [unite]

" ファイル一覧
nnoremap <silent> [unite]f  :<C-u>UniteWithCurrentDir -buffer-name=files file file/new<CR>
" 最近使用したファイル一覧
nnoremap <silent> [unite]h  :<C-u>Unite file_mru<CR>
" snippet一覧
nnoremap <silent> [unite]s  :<C-u>Unite snippet<CR>

" ショートカット
map <Space>f :tabedit<CR>[unite]f
map <Space>h :tabedit<CR>[unite]h
map <Space>s :tabedit<CR>[unite]s

autocmd FileType unite call s:unite_my_settings()
function! s:unite_my_settings()"{{{
  " Overwrite settings.

  " ESCキーを2回押すと終了する
  nmap <buffer> <ESC>      <Plug>(unite_exit)
  nmap <buffer> <ESC><ESC> <Plug>(unite_exit)
  imap <buffer> jj      <Plug>(unite_insert_leave)

  nnoremap <silent><buffer> <C-k> :<C-u>call unite#mappings#do_action('preview')<CR>
  imap <buffer> <C-w>     <Plug>(unite_delete_backward_path)
endfunction"}}}

call unite#custom#profile('default', 'context', {
      \  'start_insert': 1,
      \  'ignore_case': 1,
      \  'smart_case': 1
      \})


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

"共有のクリップボードを使用する
set clipboard=unnamed,autoselect

" 常にステータスラインを表示
set laststatus=2

"カーソルが何行目の何列目に置かれているかを表示する
set ruler

"バックスペースでindentを無視 & 改行を越えてバックスペースを許可
set backspace=indent,eol,start

"インクリメンタルサーチを行う
set incsearch

" 検索のハイライト
set hlsearch
nmap <Esc><Esc> :nohlsearch<CR><Esc>

"タブ文字、行末など不可視文字を表示する
set list

"tabが対応する空白の数
set tabstop=2
set softtabstop=2
set shiftwidth=2
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

" \pで貼付け
inoremap <Leader>p <ESC>pi

" 移動をラクに
map 1k 10k
map 1j 10j
map 1hj 10h
map 1l 10l

map 2k 20k
map 2j 20j
map 2hj 20h
map 2l 20l

" Ctrl+sで保存, Ctrl+qで閉じ
nnoremap <C-S> :w<CR>
inoremap <C-S> <ESC>:w<CR>
nnoremap <C-Q> <ESC>:q<CR>
inoremap <C-Q> <ESC>:q<CR>

"改行コードの自動認識
set fileformats=unix,dos,mac
" □とか○の文字があってもカーソル位置がずれないようにする
if exists('&ambiwidth')
    set ambiwidth=double
endif

"-------------------------------------------------------------------------------
" タブ設定
"-------------------------------------------------------------------------------
nnoremap <SPACE>t :tabedit<Return>
nnoremap <F2>     :tabn<Return>
nnoremap <F1>     :tabprevious<Return>

set showtabline=4
