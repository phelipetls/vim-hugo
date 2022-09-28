if exists('b:current_syntax')
  finish
endif

if !exists('main_syntax')
  let main_syntax = 'html'
endif

runtime! syntax/html.vim

syn case match

syn region htmlHugoBlock matchgroup=hugoDelimiters start=/{{-\?/ end=/-\?}}/
syn cluster htmlPreProc add=htmlHugoBlock

syn keyword htmlHugoInclude partial template contained containedin=htmlHugoBlock
syn keyword htmlHugoStatement with block define end contained containedin=htmlHugoBlock
syn keyword htmlHugoRepeat range contained containedin=htmlHugoBlock
syn keyword htmlHugoConditional if else contained containedin=htmlHugoBlock
syn keyword htmlHugoOperator and or not contained containedin=htmlHugoBlock

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
  exe 'syn keyword htmlHugoFunction '. s:hugo_global_function .' contained containedin=htmlHugoBlock'
endfor

syn match htmlHugoAssignment /:=/ contained containedin=htmlHugoBlock

syn match htmlHugoPipe /\|/ contained containedin=htmlHugoBlock

syn match htmlHugoNumber /\<\d\+\([Ee]\d\+\)\?\>/ contained containedin=htmlHugoBlock

syn region htmlHugoString start=/\z(["`']\)/ end=/\z1/ skip=+\\\\\|\\\z1+ contained containedin=htmlHugoBlock
syn region htmlHugoRawString start=/`/ end=/`/ contained containedin=htmlHugoBlock

syn region htmlHugoComment start=+/\*+ end=+\*/+ matchgroup=Comment keepend extend contained containedin=htmlHugoBlock

syn match htmlHugoMethod /\.[A-Z]\k\+/hs=s+1 contained containedin=htmlHugoBlock

hi def link htmlHugoComment Comment
hi def link htmlHugoDelimiters Delimiter
hi def link htmlHugoString String
hi def link htmlHugoRawString String
hi def link htmlHugoNumber Number
hi def link htmlHugoPipe Special
hi def link htmlHugoAssignment Special
hi def link htmlHugoIdentifier Identifier
hi def link htmlHugoConditional Conditional
hi def link htmlHugoRepeat Repeat
hi def link htmlHugoOperator Operator
hi def link htmlHugoStatement Statement
hi def link htmlHugoInclude Include
hi def link htmlHugoFunction Function
hi def link htmlHugoMethod Function

let b:current_syntax = 'htmlhugo'

" vim: nowrap
