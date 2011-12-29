" vim:foldmethod=marker:fen:
scriptencoding utf-8

" Saving 'cpoptions' {{{
let s:save_cpo = &cpo
set cpo&vim
" }}}


function! s:run()
  let kind = {
      \ 'name' : 'hoge',
      \ 'default_action' : 'open',
      \ 'action_table': {},
        \ }
  let kind.action_table.open = {
        \ 'is_selectable' : 1, 
        \ }
  function! kind.action_table.open.func(candidate)
    echo 'hoge'
  endfunction
  
  Ok unite#define_kind(kind) == 0, "defined kind"
  
  let source = {
        \ 'name' : 'hoge',
        \ 'is_volatile' : 1,
        \}
  function! source.gather_candidates(args, context)"{{{
    " Add dummy candidate.
    let candidates = [ a:context.input ]

    call map(candidates, '{
          \ "word" : v:val,
          \ "source" : "hoge",
          \ "kind" : "hoge",
          \}')

    if g:unite_source_file_ignore_pattern != ''
      call filter(candidates, 'v:val.word !~ ' . string(g:unite_source_file_ignore_pattern))
    endif

    return candidates
  endfunction"}}}
  
  Ok unite#define_source(source) == 0, "defind source"

  let candidate = {
  \   'ku__source': unite#get_sources('hoge'),
  \   'word': 'EMPRESS',
  \ }

  silent! let _ = unite#take_action('*choose*', candidate)
  Like _ 'no such action'

  Ok unite#undef_kind(kind.name) == 0, "undef kind"
  Ok unite#undef_source(source.name) == 0, "undef source"
  
endfunction

call s:run()
Done


" Restore 'cpoptions' {{{
let &cpo = s:save_cpo
" }}}
