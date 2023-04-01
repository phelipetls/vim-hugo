function! s:DetectGoTemplate()
  if findfile('.hugo_build.lock', '.;') !=# ''
    set ft=htmlhugo
  elseif search('{{\s*end\s*}}')
    set ft=htmlhugo
  elseif search('{{\s*$\k\+\s*:=')
    set ft=htmlhugo
  elseif search('{{\s*\.[A-Z]')
    set ft=htmlhugo
  endif
endfunction

augroup DetectGoTemplate
  autocmd!
  autocmd BufNewFile,BufRead *.html call <SID>DetectGoTemplate()
augroup END
