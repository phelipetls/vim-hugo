if exists('loaded_matchit')
  let b:match_words=''
        \.'\%({{<\s*\)\@<=\(\k\+\)\s\+.*>}}:'
        \.'\%({{<\s*\/\)\@<=\1\s*>}},'
        \.b:match_words
endif
