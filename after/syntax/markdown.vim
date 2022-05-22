syn region hugoShortcode start=/{{[<%]/ end=/[>%]}}/ matchgroup=Delimiter keepend

syn match hugoShortcodeStartDelimiter /{{[<%]/ nextgroup=hugoShortcodeName skipwhite contained containedin=hugoShortcode
hi link hugoShortcodeStartDelimiter Delimiter

syn match hugoShortcodeEndDelimiter /[>%]}}/ contained containedin=hugoShortcode
hi link hugoShortcodeEndDelimiter Delimiter

syn match hugoShortcodeName /\k\+/ contained containedin=hugoShortcode
hi link hugoShortcodeName Statement

syn match hugoShortcodeParam /\k\+\ze=\=/ contained containedin=hugoShortcode
hi link hugoShortcodeParam Type

syn region hugoShortcodeString start=/[`"]/ end=/[`"]/ matchgroup=String contained containedin=hugoShortcode
hi link hugoShortcodeString String

syn region hugoShortcodeHighlight
      \ matchgroup=hugoShortcode
      \ start='{{[<%]\s*highlight.*[>%]}}'
      \ end='{{[<%]\s*\/highlight\s*[>%]}}'
      \ keepend
      \ contains=markdownCode

" [js=javascript, python, r] -> [javascript, python, r]
for s:lang in map(copy(get(g:,'markdown_fenced_languages',[])),'matchstr(v:val,"[^=]*$")')
  exe 'syn region hugoShortcodeHighlight'.s:lang
        \.' matchgroup=markdownCodeDelimiter'
        \.' start="{{[%<]\s\+highlight\s\+'.s:lang.'\s\+.*[>%]}}"'
        \.' end="{{[<%]\s\+\/highlight\s\+[>%]}}"'
        \.' keepend'
        \.' contains=@markdownHighlight'.substitute(s:lang,'\.','','g')
endfor

hi link hugoShortcodeHighlight markdownCode

unlet! b:current_syntax
syntax include @Yaml syntax/yaml.vim
syntax region yamlFrontmatter start=/\%^---$/ end=/^---$/ keepend contains=@Yaml
