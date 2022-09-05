syn region hugoShortcode start=/{{[<%]/ end=/[>%]}}/ matchgroup=Delimiter keepend

syn match hugoShortcodeStartDelimiter /{{[<%]/ nextgroup=hugoShortcodeName skipwhite contained containedin=hugoShortcode
hi link hugoShortcodeStartDelimiter Delimiter

syn match hugoShortcodeEndDelimiter /[>%]}}/ contained containedin=hugoShortcode
hi link hugoShortcodeEndDelimiter Delimiter

syn match hugoShortcodeName +/\=\k\++ contained containedin=hugoShortcode
hi link hugoShortcodeName Statement

syn match hugoShortcodeParam /\k\+\ze=\=/ contained containedin=hugoShortcode
hi link hugoShortcodeParam Type

syn region hugoShortcodeString start=/\z([`"]\)/ end=/\z1/ matchgroup=String contained containedin=hugoShortcode
hi link hugoShortcodeString String

syn region hugoShortcodeHighlight
      \ start='^{{[<%]\s\+highlight.*[>%]}}'ms=s-1
      \ end='^{{[<%]\s\+\/highlight\s\+[>%]}}'ms=s-1
      \ keepend
      \ contains=hugoShortcode,markdownCode

" [js=javascript, python, r] -> [javascript, python, r]
for s:lang in map(copy(get(g:,'markdown_fenced_languages',[])),'matchstr(v:val,"[^=]*$")')
  exe 'syn region hugoShortcodeHighlight'.s:lang
        \.' start="^{{[%<]\s\+highlight\s\+'.s:lang.'\s\+.*[>%]}}"ms=s-1'
        \.' end="^{{[<%]\s\+\/highlight\s\+[>%]}}"ms=s-1'
        \.' keepend'
        \.' contains=hugoShortcode,@markdownHighlight'.substitute(s:lang,'\.','','g')
endfor

hi link hugoShortcodeHighlight markdownCode

unlet! b:current_syntax
syntax include @Yaml syntax/yaml.vim
syntax region yamlFrontmatter start=/\%^---$/ end=/^---$/ keepend contains=@Yaml
