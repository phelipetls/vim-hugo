if exists('b:current_syntax')
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'html'
endif

runtime! syntax/html.vim

syn case match

syn region hugoBlock matchgroup=hugoDelimiters start=/{{-\?/ end=/-\?}}/
syn cluster htmlPreProc add=hugoBlock

syn keyword hugoInclude partial template contained containedin=hugoBlock
syn keyword hugoStatement with block define end contained containedin=hugoBlock
syn keyword hugoRepeat range contained containedin=hugoBlock
syn keyword hugoConditional if else contained containedin=hugoBlock
syn keyword hugoOperator and or not contained containedin=hugoBlock

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
  exe 'syn keyword hugoFunction '. s:hugo_global_function .' contained containedin=hugoBlock'
endfor

syn match hugoAssignment /:=/ contained containedin=hugoBlock

syn match hugoPipe /\|/ contained containedin=hugoBlock

syn match hugoNumber /\<\d\+\([Ee]\d\+\)\?\>/ contained containedin=hugoBlock

syn region hugoString start=/\z(["`']\)/ end=/\z1/ contained containedin=hugoBlock

syn region hugoComment start=+/\*+ end=+\*/+ matchgroup=Comment keepend extend contained containedin=hugoBlock

syn match hugoMethod /\.[A-Z]\k\+/hs=s+1 contained containedin=hugoBlock

hi def link hugoComment Comment
hi def link hugoDelimiters Delimiter
hi def link hugoString String
hi def link hugoNumber Number
hi def link hugoPipe Special
hi def link hugoAssignment Special
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
