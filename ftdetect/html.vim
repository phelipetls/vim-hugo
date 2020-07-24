function! s:DetectGoTemplate()
  if search("{{ end }}")
    set ft=htmlhugo
  endif
endfunction

au BufNewFile,BufRead *.html call s:DetectGoTemplate()
