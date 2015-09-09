" ==================================================
" Key Bindings
" ==================================================

let mapleader = "\<Space>"

" eclim bindings
" OmniCompletion CTRL-X, CTRL-O
let g:EclimCompletionMethod = 'omnifunc'
"
" Open a quick list of all buffers
nmap <leader>bt :BuffersToggle<CR>

" Change two vertical splits to horizontal splits
nmap <leader>sp <C-w>t<C-w>K

" Change two horizontal splits to vertical splits
nmap <leader>vs <C-w>t<C-w>H

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

" hide searh results
nnoremap \] /akosdjfhaosdhjkif<CR>

" insert the class name into the current location
imap <leader>cn <c-r>=expand('%:t:r')<cr>

" ==================================================
" Plugins
" ==================================================
let g:project_use_nerdtree = 1

" Close NERDTree when opening a file
let NERDTreeQuitOnOpen = 0

" Powerline (Fancy thingy at bottom stuff)
set laststatus=2   " Always show the statusline
set encoding=utf-8 " Necessary to show Unicode glyphs
set noshowmode " Hide the default mode text (-- INSERT -- below the statusline)

" Control P
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'

let g:ctrlp_custom_ignore = {
            \ 'dir':  '\v[\/]\.(git|hg|svn|target|project)$',
            \ 'file': '\v\.(exe|so|dll|class|jar)$',
            \ 'link': 'some_bad_symbolic_links',
            \ }

" ==================================================
" Settings
" ==================================================

call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'kien/ctrlp.vim'
Plug 'powerline/powerline'
Plug 'derekwyatt/vim-scala'
Plug 'altercation/vim-colors-solarized'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/bufkill.vim'
Plug 'vim-scripts/BufOnly.vim'

call plug#end()

let g:solarized_termcolors=256
set background=light
colorscheme solarized

set list                        " Makes the whitespace visible
set guifont=Inconsolata:h16
set splitright                  " Puts new v-split to the right of the current
set splitbelow                  " Puts new split windows to the bottom 
set nu                          " Always show line numbers
set ignorecase                  " Case insensitive searches
set tabstop=4                   " Tab Stop at 4 unless plugin overwrites it
set shiftwidth=4
set expandtab                   " Always use spaces instead of tabs

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Color columns at 80 lines and 120 lines
set colorcolumn=120            " Sets 120 as the column limit drawdown mark
set colorcolumn=80             " Sets 80 as the column limit drawdown mark
let &colorcolumn="80,".join(range(120,999),",")

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


" ==================================================
" Functions
" ==================================================
