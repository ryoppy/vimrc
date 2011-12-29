" A plugin for neocomplecache to complete snipMate snippets.
" Version: 0.0
" Author : thinca <http://d.hatena.ne.jp/thinca/>
" License: Creative Commons Attribution 2.1 Japan License
"          <http://creativecommons.org/licenses/by/2.1/jp/deed.en>


let s:save_cpo = &cpo
set cpo&vim


function! neocomplcache#snipMate_complete#initialize() "{{{
  " Initialize
  let s:snip_list = {}
endfunction "}}}

function! neocomplcache#snipMate_complete#finalize() "{{{
endfunction "}}}

function! neocomplcache#snipMate_complete#get_keyword_list(cur_keyword_str) "{{{
  let snips = GetSnippetsList(&filetype)
  if empty(snips)
    return []
  endif
  let ft = empty(&filetype) ? '_' : &filetype

  if !has_key(s:snip_list, ft)
    let list = []
    for trig in keys(snips)
      let list += [{'word' : trig, 'menu' : '[snipMate]', 'prev_word' : ['^'],
        \ 'rank' : 1, 'prev_rank' : 0, 'prepre_rank' : 0, 'abbr' : trig}]
    endfor
    let s:snip_list[ft] = list
  else
    let list = s:snip_list[ft]
  endif

  return neocomplcache#keyword_filter(copy(list), a:cur_keyword_str)
endfunction "}}}

" Dummy function.
function! neocomplcache#snipMate_complete#calc_rank(cache_keyword_buffer_list) "{{{
endfunction "}}}
function! neocomplcache#snipMate_complete#calc_prev_rank(cache_keyword_buffer_list, prev_word, prepre_word) "{{{
endfunction "}}}


let &cpo = s:save_cpo
unlet s:save_cpo

" vim: foldmethod=marker
