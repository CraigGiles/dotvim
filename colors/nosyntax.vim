"
" Colorscheme based off of gilesc without syntax highlights
"
set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "nosyntax"
" Test Color: #40FF40

" Vertical Line Separator
hi VertSplit ctermfg=60 ctermbg=236 cterm=NONE guifg=#404245 guibg=#404245 gui=NONE

"  Cursor to green
hi Cursor ctermfg=188 ctermbg=250 cterm=NONE guifg=#393939 guibg=#40FF40 gui=NONE

"  cursor line to midnight blue
hi CursorLine ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#191970 gui=NONE

" Background text 
hi Normal ctermfg=188 ctermbg=235 cterm=NONE guifg=#D2CBC0 guibg=#072626 gui=NONE
hi NonText ctermfg=188 ctermbg=235 cterm=NONE guifg=#D2CBC0 guibg=#072626 gui=NONE

" Comments
hi Comment ctermfg=244 ctermbg=NONE cterm=NONE guifg=#7f7f7f guibg=NONE gui=NONE

" Strings
hi String ctermfg=71 ctermbg=NONE cterm=NONE guifg=#65b29e guibg=NONE gui=NONE

" %d and such in c strings, objects in scala, etc
hi Special ctermfg=172 ctermbg=NONE cterm=NONE guifg=#d58b48 guibg=NONE gui=NONE

" Status Line
hi StatusLine ctermfg=67 ctermbg=236 cterm=bold guifg=#000000 guibg=#cdaa7d gui=bold

" hi Constant ctermfg=103 ctermbg=NONE cterm=NONE guifg=#6B8E23 guibg=NONE gui=NONE
hi Constant ctermfg=103 ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Character ctermfg=71 ctermbg=NONE cterm=NONE guifg=#65B29E guibg=NONE gui=NONE
hi Keyword ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Conditional ctermfg=172 ctermbg=NONE cterm=NONE guifg=#DAB98F guibg=NONE gui=NONE
hi Label ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

hi Boolean ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Function ctermfg=NONE ctermbg=NONE cterm=bold guifg=#d2cbc0 guibg=NONE gui=NONE
hi PreProc ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#DAB98F guibg=NONE gui=NONE
hi Directory ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#6495ed guibg=NONE gui=italic

hi Statement ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#D2CBC0 guibg=NONE gui=NONE
hi Todo ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Identifier ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
" hi Number ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE

hi Number ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#CDAA7D guibg=NONE gui=NONE
hi Visual ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#214283 gui=NONE
hi Folded ctermfg=244 ctermbg=235 cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi IncSearch term=reverse ctermfg=188 ctermbg=24 guifg=#404245 guibg=#b1c73d gui=none
hi Search term=reverse ctermfg=188 ctermbg=24 guifg=#b8c4d0 guibg=#214283 gui=none
