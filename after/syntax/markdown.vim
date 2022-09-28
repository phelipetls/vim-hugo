syn region markdownHugoShortcode start=/{{[<%]/ end=/[>%]}}/ matchgroup=Delimiter keepend

syn match markdownHugoShortcodeStartDelimiter /{{[<%]/ nextgroup=markdownHugoShortcodeName skipwhite contained containedin=markdownHugoShortcode
hi link markdownHugoShortcodeStartDelimiter Delimiter

syn match markdownHugoShortcodeEndDelimiter /[>%]}}/ contained containedin=markdownHugoShortcode
hi link markdownHugoShortcodeEndDelimiter Delimiter

syn match markdownHugoShortcodeName +/\=\k\++ contained containedin=markdownHugoShortcode
hi link markdownHugoShortcodeName Statement

syn match markdownHugoShortcodeParam /\k\+\ze=\=/ contained containedin=markdownHugoShortcode
hi link markdownHugoShortcodeParam Type

syn region markdownHugoShortcodeString start=/\z([`"]\)/ end=/\z1/ matchgroup=String contained containedin=markdownHugoShortcode
hi link markdownHugoShortcodeString String

syn region markdownHugoShortcodeHighlight
      \ start='^{{[<%]\s\+highlight.*[>%]}}'ms=s-1
      \ end='^{{[<%]\s\+\/highlight\s\+[>%]}}'ms=s-1
      \ keepend
      \ contains=markdownHugoShortcode,markdownCode

" [js=javascript, python, r] -> [javascript, python, r]
for s:lang in map(copy(get(g:,'markdown_fenced_languages',[])),'matchstr(v:val,"[^=]*$")')
  exe 'syn region markdownHugoShortcodeHighlight'.s:lang
        \.' start="^{{[%<]\s\+highlight\s\+'.s:lang.'\s\+.*[>%]}}"ms=s-1'
        \.' end="^{{[<%]\s\+\/highlight\s\+[>%]}}"ms=s-1'
        \.' keepend'
        \.' contains=markdownHugoShortcode,@markdownHighlight'.substitute(s:lang,'\.','','g')
endfor

hi link markdownHugoShortcodeHighlight markdownCode

unlet! b:current_syntax
syntax include @Yaml syntax/yaml.vim
syntax region yamlFrontmatter start=/\%^---$/ end=/^---$/ keepend contains=@Yaml
