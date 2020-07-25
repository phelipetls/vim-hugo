function! s:DetectGoTemplate()
  if search("{{ end }}")
    set ft=htmlhugo
  elseif search("{{ *\.[A-Z]")
    set ft=htmlhugo
  endif
endfunction

au BufNewFile,BufRead *.html call s:DetectGoTemplate()
