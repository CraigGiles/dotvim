colorscheme jblow
nnoremap <Space>ed :source ~/.vimrc<CR>

source ~/.vim/config/plugins.vim
source ~/.vim/config/statusline.vim

" -------------------------------------------------
"   Key Bindings
" =================================================
nmap tt :vs<CR><C-w>T

" Escape to normal mode from insert mode with jj / jk
inoremap jj <ESC>
inoremap jk <ESC>

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Turn off that stupid highlight search
nnoremap <silent> <Space>n :noh<CR>

" When selecting text in visual mode,
" Delete or Backspace removes it
vmap <BS> x

" git related commands
nnoremap ga :Gblame<CR>

" Move to next / previous blank line
nnoremap <C-j> /^$<CR>:noh<CR>
nnoremap <C-k> ?^$<CR>:noh<CR>

" After doing a search, hitting 'CTRL-f-f' will fold all
" the results for easier display
nmap <silent> <expr>  <C-f><C-f>  FS_ToggleFoldAroundSearch({'context':1})

" Make search results be in the center of the window
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

if has('gui_macvim')
  nmap <D-m> :Dispatch make<CR>
endif

" -------------------------------------------------
"   settings
" =================================================
if has('gui_macvim')
  " Disable the print menu
  :aunmenu File.Print

  set guifont=Liberation\ Mono:h14
  set guioptions=          " Don't have scroll bars
endif

set lines=999 columns=9999 " Start vim in "full screen"
set splitright             " Puts new v-split to the right of the current
set splitbelow             " Puts new split windows to the bottom
set ignorecase             " Case insensitive searches
set incsearch              " Incremental searches
set smartcase              " Case sensitive when wanted
set hlsearch               " Highlight all the search results
highlight       Search    ctermfg=Red ctermbg=Yellow guifg=Red guibg=Yellow

set tabstop=4              " Tab Stop at 4 unless plugin overwrites it
set shiftwidth=4
set linespace=4            " Vertical line space
set expandtab              " Always use spaces instead of tabs
set autoread               " Read a file that has changed on disk
set autowrite              " Auto write to disk when buffer is changed
set autowriteall
set hidden                 " Allow modified buffers in the background
set ruler
set modeline               " Allow modeline ( :help modeline )
set mouse=a                " Use the mouse for things like resizing windows
set noshowmode             " Doesn't show what mode you're in
set cursorline             " Show the horizontal bar where the cursor is
set scrolloff=8            " Keep cursor 8 lines from top and bottom while scrolling

set nobackup               " don't use backup files
set nowb                   " don't use backup files
set noswapfile             " don't use swap files

" undo all the things
if has('persistent_undo')
    set undolevels=5000
    set undodir=$HOME/.VIM_UNDO_FILES
    set undofile
endif

" I don't want to pull up these folders/files when calling my fuzzy finder
set wildignore+=*/vendor/**
set wildignore+=*/target/**
set wildignore+=*/cli/**
set wildignore+=*/logs/**
set wildignore+=*/sql/**
set wildignore+=*/tools/**
set wildignore+=*/docroot/res/out/**
set wildignore+=*.swp
set wildignore+=*.bak

" Re-add these since i want my fuzzy finder to find them
set wildignore-=*.thrift
set wildignore-=*.sql

" vim:set sw=2 sts=2 foldmethod=marker foldlevel=0:
