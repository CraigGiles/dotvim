" Fixme syntax highlighting
" This file provides syntax highlighting for TODO, NOTE, and DONE tags

if exists("b:current_syntax")
  finish
endif

" Define the syntax groups
syntax keyword FixMeTodo TODO containedin=ALL
syntax keyword FixMeNote NOTE containedin=ALL
syntax keyword FixMeDone DONE containedin=ALL

" Link to highlight groups
highlight default link FixMeTodo FixMeTodo
highlight default link FixMeNote FixMeNote
highlight default link FixMeDone FixMeDone

let b:current_syntax = "fixme" 