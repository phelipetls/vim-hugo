if exists("b:did_ftplugin")
  finish
endif

runtime! ftplugin/html.vim

setlocal iskeyword+=$

setlocal path+=layouts,resources,content,archetypes,static,data,layouts/_default,layouts/partials,..

setlocal commentstring={{/*%s*/}}

if exists("loaded_matchit")
  let b:match_words=b:match_words.","
        \.'\(define\|with\|range\|if\):'
        \.'else \(if .*\)\?}}:'
        \.'end }},'
endif

let b:undo_ftplugin = "setlocal com< path< isk<"
