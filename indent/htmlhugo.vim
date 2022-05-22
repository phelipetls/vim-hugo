" Only load this indent file when no other was loaded.
if exists('b:did_indent')
  finish
endif

let b:did_indent = 1

if &l:indentexpr == ''
  if &l:cindent
    let &l:indentexpr = 'cindent(v:lnum)'
  else
    let &l:indentexpr = 'indent(prevnonblank(v:lnum-1))'
  endif
endif
let b:html_indentexpr = &l:indentexpr

runtime! indent/html.vim

setlocal indentexpr=GetHugoIndent()
setlocal indentkeys+==else,=end,=if,=range,=with,=define,=block

" Only define the function once.
if exists('*GetHugoIndent')
  finish
endif

function! GetHugoIndent()
  " Get HTML indent
  if exists('*HtmlIndent')
    let l:ind = HtmlIndent()
  else
    let l:ind = HtmlIndentGet(v:lnum)
  endif

  " The value of a single shift-width
  if exists('*shiftwidth')
    let l:sw = shiftwidth()
  else
    let l:sw = &sw
  endif

  " If need to indent based on last line
  let l:last_line = getline(v:lnum-1)
  if l:last_line =~# '^\s*{{-\=\s*\%(if\|else\|range\|with\|define\|block\).*}}' && l:last_line !~# '{{-\=\s*end\s*-\=}}'
    let l:ind += l:sw
  endif

  " End of FuncMap block
  let l:current_line = getline(v:lnum)
  if l:current_line =~# '^\s*{{-\=\s*\%(else\|end\).*}}'
    let l:ind -= l:sw
  endif

  return l:ind
endfunction
