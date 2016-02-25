" ==================================================
" Key Bindings
" =================================================

let mapleader = "\<Space>"

nnoremap / /\v

" Unite key bindings
nnoremap <C-p> :Unite -start-insert tag<CR>
nnoremap <leader>f :<C-u>Unite -start-insert file_rec<CR>
nnoremap <leader>ls :Unite buffer<CR>

" Easy opening of splits
nmap vs :vs<CR>
nmap sp :sp<CR>

" Change two vertical splits to horizontal splits
nmap <leader>sp <C-w>t<C-w>K

" Change two horizontal splits to vertical splits
nmap <leader>vs <C-w>t<C-w>H

" Easy open and source of vimrc
nmap <leader>ed :vs ~/.vimrc<CR>
nmap <leader>sv :source ~/.vimrc<CR>

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Escape to normal mode from insert mode with jj
imap jj <ESC>

" Increase vertical split size by 5
nmap + :vertical resize +5<CR>

" git related commands
nmap ga :Gblame<CR>

" highlight all the things
nmap <leader>a ggVG

" File navigation and IDE like settings
map <leader>1 :NERDTreeToggle<CR>
nmap <leader>2 :NERDTreeFind<CR>
nmap <leader>7 :TagbarToggle<CR>

" Jump to definition, <C-t> jumps back
nmap <C-b> g]

" Code Completion
imap <C-Space> <C-x><C-o>

" hide searh results
nnoremap \] /akosdjfhaosdhjkif<CR>

" insert the class name into the current location
imap <leader>cn <c-r>=expand('%:t:r')<cr>

" Turn off that stupid highlight search
nmap <silent> <leader>n :nohls<CR>

" Add a GUID to current line
imap <C-J>d <C-r>=substitute(system("uuidgen"), '.$', '', 'g')<CR>

" Underline the current line with '='
nmap <silent> <leader>u= :t.\|s/./=/g\|:nohls<cr>
nmap <silent> <leader>u- :t.\|s/./-/g\|:nohls<cr>
nmap <silent> <leader>u~ :t.\|s/./\\~/g\|:nohls<cr>

" ==================================================
" Plugin Settings
" ==================================================
let g:project_use_nerdtree = 1
let g:scala_use_default_keymappings = 0

" Close NERDTree when opening a file
let NERDTreeQuitOnOpen = 0

" Gutentags
let g:gutentags_cache_dir=".git"

set laststatus=2
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [ [ 'mode', 'gutentags#statusline()' ],
      \             [ 'readonly', 'fugitive', 'filename', 'modified' ] ]
      \ },
      \ 'component': {
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ }

" ==================================================
" Plugins
" ==================================================
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'Shougo/unite.vim'
Plug 'derekwyatt/vim-scala'
Plug 'altercation/vim-colors-solarized'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/bufkill.vim'
Plug 'vim-scripts/BufOnly.vim'
Plug 'elzr/vim-json'
Plug 'airblade/vim-gitgutter'
Plug 'ludovicchabant/vim-gutentags'
Plug 'tsukkee/unite-tag'
Plug 'itchyny/lightline.vim'

call plug#end()


" ==================================================
" Settings
" ==================================================
let g:solarized_termcolors=256
set background=light
colorscheme solarized

set list                        " Makes the whitespace visible
set guifont=Menlo:h14
set splitright                  " Puts new v-split to the right of the current
set splitbelow                  " Puts new split windows to the bottom 
set nu                          " Always show line numbers
set ignorecase                  " Case insensitive searches
set smartcase                   " Case sensitive when wanted
set tabstop=4                   " Tab Stop at 4 unless plugin overwrites it
set shiftwidth=4
set expandtab                   " Always use spaces instead of tabs
set autoread                    " Read a file that has changed on disk
set hidden                      " Allow modified buffers in the background
set ruler
set statusline+=%{gutentags#statusline()}

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

" Sets the timeout length for how long we'll 'pause' when waiting for a
" keypress after leader key
set timeoutlen=400

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
function! ScalaInsertPackage()
    silent! execute "normal! gg0"
    r! echo %:p
    s/.*\/scala//
    s/\.scala//
    s/\//./g
    silent! execute "normal! 0xipackage\<Space>\<esc>kdd"
    silent! execute "normal! $daw$xo\<ESC>"
endfunction

command! ScalaInsertPackage call ScalaInsertPackage()

