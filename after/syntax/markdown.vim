syn region hugoShortcode start=/{{[<%]/ end=/[>%]}}/ matchgroup=PreProc nextgroup=hugoShortcodeName
hi link hugoShortcode PreProc

syn match hugoShortcodeName /\({{[<%] \)\zs\f\+\s/ contained containedin=hugoShortcode
hi link hugoShortcodeName Statement

syn match hugoShortcodeArg /\({{[<%] \)\@4<!\k\+/ contained containedin=hugoShortcode
hi link hugoShortcodeArg Type

syn region hugoShortcodeString start=/[`"]/ end=/[`"]/ matchgroup=String contained containedin=hugoShortcode
hi link hugoShortcodeString String

" \.' matchgroup=markdownCodeDelimiter'
for s:lang in map(copy(g:markdown_fenced_languages),'matchstr(v:val,"[^=]*$")')
  exe 'syn region hugoShortcodeHighlight'.s:lang
        \.' matchgroup=hugoShortcode'
        \.' start="{{<\s*highlight\s*\<'.s:lang.'\>\s*>}}"'
        \.' end="{{<\s*\/highlight\s*>}}"'
        \.' keepend'
        \.' contains=@markdownHighlight'.substitute(s:lang,'\.','','g')
endfor
unlet! s:langs

unlet! b:current_syntax
syntax include @Yaml syntax/yaml.vim
syntax region yamlFrontmatter start=/\%^---$/ end=/^---$/ keepend contains=@Yaml
