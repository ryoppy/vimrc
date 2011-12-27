
" Global Options
"
" Enable/Disable highlighting of errors in source.
" Default is Enable
" To disable the highlighting put the line
" let g:jslint_highlight_error_line = 0
" in your .vimrc
"
"
" autocmd FileType javascript call s:javascript_filetype_settings()
" function! s:javascript_filetype_settings()
"   autocmd BufLeave     <buffer> call jslint#clear()
"   autocmd BufWritePost <buffer> call jslint#check()
"   autocmd CursorMoved  <buffer> call jslint#message()
" endfunction
"
"
"
if exists("b:did_jslint_plugin")
  finish
else
  let b:did_jslint_plugin = 1
endif

if !exists('g:jslint_highlight_error_line')
  let g:jslint_highlight_error_line = 1
endif

command JSLint :call jslint#check()
command JSLintToggle :let b:jslint_disabled = exists('b:jslint_disabled') ? b:jslint_disabled ? 0 : 1 : 1


