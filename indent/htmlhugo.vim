" Only load this indent file when no other was loaded.
if exists("b:did_indent")
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
setlocal indentkeys+==else,==end

" Only define the function once.
if exists("*GetHugoIndent")
  finish
endif

function! GetHugoIndent()
  " Get HTML indent
  if exists('*HtmlIndent')
    let ind = HtmlIndent()
  else
    let ind = HtmlIndentGet(v:lnum)
  endif

  " The value of a single shift-width
  if exists('*shiftwidth')
    let sw = shiftwidth()
  else
    let sw = &sw
  endif

  " If need to indent based on last line
  let last_line = getline(v:lnum-1)
  if last_line =~ '^\s*{{-\=\s*\%(if\|else\|range\|with\|define\|block\).*}}'
    if last_line !~ '{{-\= end -\=}}'
      let ind += sw
    endif
  endif

  " End of FuncMap block
  let current_line = getline(v:lnum)
  if current_line =~ '^\s*{{-\=\s*\%(else\|end\).*}}'
    let ind -= sw
  endif

  return ind
endfunction
