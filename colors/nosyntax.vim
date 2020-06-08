"
" Colorscheme similar to jonathan blow's from his streams
"
set background=dark
highlight clear

if exists("syntax_on")
  syntax reset
endif

let g:colors_name = "nosyntax"
" Test Color: #40FF40

" Modified
" ----------------------------------------------------------------------------------
hi Cursor ctermfg=188 ctermbg=250 cterm=NONE guifg=#393939 guibg=#40FF40 gui=NONE
hi CursorLine ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#191970 gui=NONE
hi Normal ctermfg=188 ctermbg=235 cterm=NONE guifg=#D2CBC0 guibg=#072626 gui=NONE
hi NonText ctermfg=188 ctermbg=235 cterm=NONE guifg=#D2CBC0 guibg=#072626 gui=NONE
hi Comment ctermfg=244 ctermbg=NONE cterm=NONE guifg=#7f7f7f guibg=NONE gui=NONE
hi Constant ctermfg=103 ctermbg=NONE cterm=NONE guifg=#6b8e23 guibg=NONE gui=NONE
hi String ctermfg=71 ctermbg=NONE cterm=NONE guifg=#65b29e guibg=NONE gui=NONE
hi Character ctermfg=71 ctermbg=NONE cterm=NONE guifg=#65b29e guibg=NONE gui=NONE
hi Statement ctermfg=222 ctermbg=NONE cterm=NONE guifg=#DAB98F guibg=NONE gui=NONE
hi StatusLine ctermfg=67 ctermbg=236 cterm=bold guifg=#000000 guibg=#cdaa7d gui=bold
hi Keyword ctermfg=172 ctermbg=NONE cterm=NONE guifg=#DAB98F guibg=NONE gui=NONE
hi Conditional ctermfg=172 ctermbg=NONE cterm=NONE guifg=#DAB98F guibg=NONE gui=NONE
hi Number ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#CDAA7D guibg=NONE gui=NONE

hi Boolean ctermfg=103 ctermbg=NONE cterm=NONE guifg=#d58b48 guibg=NONE gui=NONE
hi Function ctermfg=221 ctermbg=NONE cterm=bold guifg=#d2cbc0 guibg=NONE gui=NONE
hi PreProc ctermfg=172 ctermbg=NONE cterm=NONE guifg=#DAB98F guibg=NONE gui=NONE
hi Directory ctermfg=103 ctermbg=NONE cterm=NONE guifg=#6495ed guibg=NONE gui=italic

" %d and such in c strings, objects in scala, etc
" hi Special ctermfg=172 ctermbg=NONE cterm=NONE guifg=#d58b48 guibg=NONE gui=NONE
hi Special ctermfg=172 ctermbg=NONE cterm=NONE guifg=#D58B48 guibg=NONE gui=NONE

hi Todo ctermfg=red ctermbg=NONE cterm=bold guifg=#CD2626 guibg=NONE gui=bold

" hi VertSplit ctermfg=60 ctermbg=236 cterm=NONE guifg=#000000 guibg=#000000 gui=NONE
" hi VertSplit ctermfg=60 ctermbg=236 cterm=NONE guifg=#cdaa7d guibg=#cdaa7d gui=NONE
" hi VertSplit ctermfg=60 ctermbg=236 cterm=NONE guifg=#404245 guibg=NONE gui=NONE
" hi VertSplit ctermfg=60 ctermbg=236 cterm=NONE guifg=NONE guibg=#404245 gui=NONE
hi VertSplit ctermfg=60 ctermbg=236 cterm=NONE guifg=#404245 guibg=#404245 gui=NONE

" hi Identifier ctermfg=222 ctermbg=NONE cterm=NONE guifg=#ffcf85 guibg=NONE gui=NONE
hi Identifier ctermfg=222 ctermbg=NONE cterm=NONE guifg=#DAB98F guibg=NONE gui=NONE

" hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
hi Type ctermfg=NONE ctermbg=NONE cterm=NONE guifg=#cd950c guibg=NONE gui=NONE

" Not Modified
" ----------------------------------------------------------------------------------

" hi Visual ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#214283 gui=NONE
" hi CursorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#38393b gui=NONE
" hi ColorColumn ctermfg=NONE ctermbg=236 cterm=NONE guifg=NONE guibg=#38393b gui=NONE
" hi LineNr ctermfg=60 ctermbg=236 cterm=NONE guifg=#9a9a9a guibg=#404245 gui=NONE
" hi CursorLineNr ctermfg=222 ctermbg=60 cterm=NONE guifg=#ffcf85 guibg=#6a7170 gui=NONE
" hi MatchParen ctermfg=173 ctermbg=NONE cterm=underline guifg=#d58b48 guibg=NONE gui=underline
" hi StatusLineNC ctermfg=188 ctermbg=236 cterm=NONE guifg=#9a9a9a guibg=#404245 gui=NONE
" hi Pmenu ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
" hi PmenuSel ctermfg=NONE ctermbg=24 cterm=NONE guifg=NONE guibg=#214283 gui=NONE
" hi Search term=reverse ctermfg=188 ctermbg=24 guifg=#b8c4d0 guibg=#214283 gui=none
" hi IncSearch term=reverse ctermfg=188 ctermbg=24 guifg=#404245 guibg=#b1c73d gui=none
" hi Folded ctermfg=244 ctermbg=235 cterm=NONE guifg=#8e9292 guibg=#393939 gui=NONE

" hi Boolean ctermfg=103 ctermbg=NONE cterm=NONE guifg=#d58b48 guibg=NONE gui=NONE
" hi Define ctermfg=172 ctermbg=NONE cterm=NONE guifg=#d58b48 guibg=NONE gui=bold
" hi DiffAdd ctermfg=188 ctermbg=64 cterm=bold guifg=#b8c4d0 guibg=#365546 gui=bold
" hi DiffDelete ctermfg=88 ctermbg=NONE cterm=NONE guifg=#8c0909 guibg=NONE gui=NONE
" hi DiffChange ctermfg=188 ctermbg=23 cterm=NONE guifg=#b8c4d0 guibg=#263b59 gui=NONE
" hi DiffText ctermfg=188 ctermbg=24 cterm=bold guifg=#b8c4d0 guibg=#204a87 gui=bold
" hi ErrorMsg ctermfg=15 ctermbg=88 cterm=NONE guifg=#ffffff guibg=#990000 gui=NONE
" hi WarningMsg ctermfg=15 ctermbg=88 cterm=NONE guifg=#ffffff guibg=#990000 gui=NONE
" hi Float ctermfg=67 ctermbg=NONE cterm=NONE guifg=#7ca8c6 guibg=NONE gui=NONE
" hi Label ctermfg=103 ctermbg=NONE cterm=NONE guifg=#9f8db7 guibg=NONE gui=NONE
" hi Number ctermfg=67 ctermbg=NONE cterm=NONE guifg=#7ca8c6 guibg=NONE gui=NONE
" hi Operator ctermfg=250 ctermbg=NONE cterm=NONE guifg=#b8c4d0 guibg=NONE gui=NONE
" hi SpecialKey ctermfg=250 ctermbg=236 cterm=NONE guifg=#bfbfbf guibg=#38393b gui=NONE
" hi StorageClass ctermfg=172 ctermbg=NONE cterm=NONE guifg=#d58b48 guibg=NONE gui=NONE

" hi Tag ctermfg=NONE ctermbg=NONE cterm=NONE guifg=NONE guibg=NONE gui=NONE
" hi Title ctermfg=159 ctermbg=NONE cterm=bold guifg=#b8c4d0 guibg=NONE gui=bold
" hi Underlined ctermfg=NONE ctermbg=NONE cterm=underline guifg=NONE guibg=NONE gui=underline
