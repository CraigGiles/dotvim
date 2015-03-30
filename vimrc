" ==================================================
" Key Bindings
" ==================================================

" Easy open and source of vimrc
nmap <leader>ed :vs ~/.vimrc<CR>
nmap <leader>sv :source ~/.vimrc<CR>

" Easy opening of splits
nmap vs :vs<CR>
nmap sp :sp<CR>

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Escape to normal mode from insert mode with jj
imap jj <ESC>

" Increase vertical split size by 5
nmap + :vertical resize +5<CR>

" git related commands
nmap ga :Gblame<CR>
nmap gs :Gstatus<CR>
nmap gm :Gcommit<CR>

nmap <leader>a ggVG

" File navigation and IDE like settings
map <leader>1 :NERDTreeToggle<CR>
nmap <leader>2 :NERDTreeFind<CR>
nmap <leader>7 :TagbarToggle<CR>

" Jump to definition, <C-t> jumps back
nmap <C-b> <C-]>zz

" set or remove spell check
nnoremap \\ :set spell!<CR>

" hide searh results
nnoremap \] /akosdjfhaosdhjkif<CR>

" ==================================================
" Plugins
" ==================================================
execute pathogen#infect()
call pathogen#helptags()

let g:project_use_nerdtree = 1
let NERDTreeQuitOnOpen = 1
let g:neocomplete#enable_at_startup = 1

" Trigger configuration. Do not use <tab> if you use https://github.com/Valloric/YouCompleteMe.
let g:UltiSnipsExpandTrigger="<tab>"

" If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" Powerline (Fancy thingy at bottom stuff)
" let g:Powerline_symbols = 'fancy'
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (e.g. -- INSERT -- below the statusline)

" Control P
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|target|project)$',
  \ 'file': '\v\.(exe|so|dll|class|jar)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"  ==================================================
" Settings
" ==================================================

let g:solarized_termcolors=256
set background=dark
colorscheme solarized

set splitright			" Puts new v-split to the right of the current
set splitbelow                  " Puts new split windows to the bottom of the current
set nu				" Always show line numbers
set tags=tags

set nobackup                    " don't use backup files
set nowb                        " don't use backup files
set noswapfile                  " don't use swap files

" I don't want to pull up these folders/files when calling COMMAND-T
set wildignore+=*/vendor/**
set wildignore+=*/target/**
set wildignore+=*/cli/**
set wildignore+=*/logs/**
set wildignore+=*/sql/**
set wildignore+=*/tools/**
set wildignore+=*/docroot/res/out/**
set wildignore+=*.swp   
set wildignore+=*.bak  

