function! s:DetectGoTemplate()
  if search('{{ end }}')
    set ft=htmlhugo
  elseif search('{{ *\.[A-Z]')
    set ft=htmlhugo
  endif
endfunction

augroup DetectGoTemplate
  autocmd!
  autocmd BufNewFile,BufRead *.html call s:DetectGoTemplate()
augroup END
