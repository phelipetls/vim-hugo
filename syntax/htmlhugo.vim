if exists('b:current_syntax')
  finish
endif

if !exists('main_syntax')
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

let s:hugo_global_functions = [
      \ 'absLangURL',
      \ 'absURL',
      \ 'after',
      \ 'anchorize',
      \ 'append',
      \ 'apply',
      \ 'base64',
      \ 'chomp',
      \ 'complement',
      \ 'cond',
      \ 'countrunes',
      \ 'countwords',
      \ 'default',
      \ 'delimit',
      \ 'dict',
      \ 'echoParam',
      \ 'emojify',
      \ 'eq',
      \ 'errorf',
      \ 'warnf',
      \ 'fileExists',
      \ 'findRE',
      \ 'first',
      \ 'float',
      \ 'ge',
      \ 'getenv',
      \ 'group',
      \ 'gt',
      \ 'hasPrefix',
      \ 'highlight',
      \ 'hmac',
      \ 'htmlEscape',
      \ 'htmlUnescape',
      \ 'humanize',
      \ 'i18n',
      \ 'in',
      \ 'index',
      \ 'int',
      \ 'intersect',
      \ 'isset',
      \ 'jsonify',
      \ 'lang',
      \ 'lang.Merge',
      \ 'last',
      \ 'le',
      \ 'len',
      \ 'lower',
      \ 'lt',
      \ 'markdownify',
      \ 'md5',
      \ 'merge',
      \ 'ne',
      \ 'now',
      \ 'partialCached',
      \ 'plainify',
      \ 'pluralize',
      \ 'print',
      \ 'printf',
      \ 'println',
      \ 'querify',
      \ 'range',
      \ 'readDir',
      \ 'readFile',
      \ 'ref',
      \ 'relLangURL',
      \ 'relref',
      \ 'relURL',
      \ 'replace',
      \ 'replaceRE',
      \ 'safeCSS',
      \ 'safeHTML',
      \ 'safeHTMLAttr',
      \ 'safeJS',
      \ 'safeURL',
      \ 'seq',
      \ 'sha',
      \ 'shuffle',
      \ 'singularize',
      \ 'site',
      \ 'slice',
      \ 'slicestr',
      \ 'sort',
      \ 'split',
      \ 'string',
      \ 'substr',
      \ 'symdiff',
      \ 'time',
      \ 'title',
      \ 'trim',
      \ 'truncate',
      \ 'union',
      \ 'uniq',
      \ 'upper',
      \ 'urlize',
      \ 'where',
      \ 'minify',
      \ 'fingerprint',
      \ 'toCSS',
      \ ]

for s:hugo_global_function in s:hugo_global_functions
  exe 'syn keyword hugoFunction '. s:hugo_global_function .' contained'
endfor

syn cluster hugoAll add=hugoFunction

syn match hugoAssignment /:=/ contained
syn match hugoPipe /\|/ contained nextgroup=hugoFunction
syn cluster hugoSpecialSymbols contains=hugoAssignment,hugoPipe
syn cluster hugoAll add=hugoAssignment,hugoPipe

syn match hugoNumber /\<\d\+\([Ee]\d\+\)\?\>/ contained
syn region hugoString start=/\z(["`']\)/ end=/\z1/ contained
syn cluster hugoAll add=hugoNumber,hugoString

syn region hugoBlock matchgroup=hugoDelimiters start=/{{-\?/ end=/-\?}}/ contains=@hugoAll
syn cluster htmlPreProc add=hugoBlock

syn region hugoComment start=+/\*+ end=+\*/+ matchgroup=Comment keepend extend contained
syn cluster hugoAll add=hugoComment

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

let b:current_syntax = 'htmlhugo'

" vim: nowrap
