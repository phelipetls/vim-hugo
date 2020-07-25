if exists("b:current_syntax")
  finish
endif

if !exists("main_syntax")
  let main_syntax = 'html'
endif

runtime! syntax/html.vim

syn case match

syn keyword hugoInclude partial template contained
syn keyword hugoStatement with block define end contained
syn keyword hugoRepeat range contained
syn keyword hugoConditional if else contained
syn keyword hugoOperator and or not contained
syn cluster hugoAll add=hugoInclude,hugoStatement,hugoRepeat,hugoConditional,hugoOperator

syn keyword hugoFunction absLangURL absURL after anchorize append apply base64 chomp contained
syn keyword hugoFunction complement cond countrunes countwords dateFormat default delimit dict echoParam emojify contained
syn keyword hugoFunction eq errorf and warnf fileExists findRE first float ge getenv group gt contained
syn keyword hugoFunction hasPrefix highlight hmac htmlEscape htmlUnescape hugo humanize i18n Image in contained
syn keyword hugoFunction index int intersect isset jsonify last le len contained
syn keyword hugoFunction lower lt markdownify Math md5 merge ne now partialCached contained
syn keyword hugoFunction plainify pluralize print printf println contained
syn keyword hugoFunction querify readDir readFile ref relLangURL relref relURL contained
syn keyword hugoFunction replace replaceRE safeCSS safeHTML safeHTMLAttr safeJS safeURL seq sha shuffle contained
syn keyword hugoFunction singularize slice slicestr sort split string strings.Repeat
syn keyword hugoFunction substr site contained
syn keyword hugoFunction symdiff time title trim truncate union uniq upper urlize where contained
syn cluster hugoAll add=hugoFunction

syn match hugoAssignment /:=/ contained
syn match hugoPipe /\|/ contained nextgroup=hugoFunction
syn cluster hugoSpecialSymbols contains=hugoAssignment,hugoPipe
syn cluster hugoAll add=hugoAssignment,hugoPipe

syn match hugoNumber /\<\d\+\([Ee]\d\+\)\?\>/ contained
syn region hugoString start=/\z(["`']\)/ end=/\z1/ contained
syn cluster hugoAll add=hugoNumber,hugoString

syn region hugoBlock matchgroup=hugoDelimiters start=/{{-\?/ end=/-\?}}/ contains=@hugoAll
syn region hugoComment start=+{{/\*+ end=+\*/}}+ keepend extend
syn cluster htmlPreProc add=hugoBlock,hugoComment

hi def link hugoComment Comment
hi def link hugoDelimiters PreProc
hi def link hugoString String
hi def link hugoNumber Number
hi def link hugoSpecialSymbols Special
hi def link hugoIdentifier Identifier
hi def link hugoConditional Conditional
hi def link hugoRepeat Repeat
hi def link hugoOperator Operator
hi def link hugoStatement Statement
hi def link hugoInclude Include
hi def link hugoFunction Function
hi def link hugoMethod Function

let b:current_syntax = "htmlhugo"

" vim: nowrap
