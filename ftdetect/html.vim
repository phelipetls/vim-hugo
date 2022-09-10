function! s:DetectGoTemplate()
  if search('{{\s*end\s*}}')
    set ft=htmlhugo
  elseif search('{{\s*$\k\+\s*:=')
    set ft=htmlhugo
  elseif search('{{\s*\.[A-Z]')
    set ft=htmlhugo
  endif
endfunction

augroup DetectGoTemplate
  autocmd!
  autocmd BufNewFile,BufRead *.html call s:DetectGoTemplate()
augroup END
