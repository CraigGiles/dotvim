call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'eiginn/netrw'
Plug 'tpope/vim-fugitive'

Plug 'nvim-telescope/telescope.nvim', { 'tag': '0.1.x' }
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-treesitter/nvim-treesitter', {'do': ':TSUpdate'}
Plug 'skywind3000/asyncrun.vim'
Plug 'rking/ag.vim'


Plug 'mbbill/undotree'

Plug 'rluba/jai.vim'
Plug 'tpope/vim-commentary'


" automatically change the directory of the buffer to the project root
Plug 'airblade/vim-rooter'
Plug 'vim-scripts/BufOnly.vim'

Plug 'masukomi/vim-markdown-folding'
Plug 'nvim-lua/plenary.nvim'
Plug 'greggh/claude-code.nvim'
call plug#end()
let g:netrw_altfile = 1
colorscheme gilesc

" After installing, add this to your init.vim:
lua require('claude-code').setup()

augroup auto_make_directory
    autocmd! auto_make_directory
    autocmd  BufNewFile  *  :call EnsureDirExists()
augroup END

augroup ags_mode
    autocmd! ags_mode
    autocmd Filetype agsv nmap <buffer> <D-n> :AgsNextResult<CR>
    autocmd Filetype agsv nmap <buffer> <D-N> :AgsPrevResult<CR>
    autocmd Filetype agsv map <buffer> q <C-^>
augroup end

"
"      --- Testing Key Bindings ---
" -----------------------------------------------------------------
"  When hilighting a row, use Control+Up / Control + Down to move those lines
"  up or down
vnoremap <C-Up> :m '<-2<CR>gv=gv
vnoremap <C-Down> :m '>+1<CR>gv=gv

function! IncreaseFontSize()
    let g:neovide_scale_factor += 0.10
endfunction
command! IncreaseFontSize call IncreaseFontSize()

function! DecreaseFontSize()
    let g:neovide_scale_factor -= 0.10
endfunction
command! DecreaseFontSize call DecreaseFontSize()

nnoremap <C-=> :call IncreaseFontSize()<CR>
nnoremap <C--> :call DecreaseFontSize()<CR>

" Keep the cursor in place when appending lines with 'J'
" nnoremap J mzJ`z"

" Keep the cursor centered after doing half page jumps
" nnoremap <C-d> <C-d>zz
" nnoremap <C-u> <C-u>zz

nnoremap <M-n> :cn<CR>
nnoremap <M-N> :cp<CR>

tnoremap <ESC> <C-\><C-n>
tnoremap jj <C-\><C-n>

nnoremap <C-f> :call SearchCodebase(expand('<cword>'))<CR>

"
"      --- Key Bindings ---
" -----------------------------------------------------------------
nnoremap <Space>ed :e $MYVIMRC<CR>
nnoremap <Space>es :source $MYVIMRC<CR>

" Exit the Ex menu without executing the command
cnoremap <C-g><C-g> <c-c>
vnoremap <C-g><C-g> <c-c>

" Escape to normal mode from insert mode with jj / jk
inoremap jj <ESC>
inoremap Jj <ESC>
inoremap JJ <ESC>
inoremap jk <ESC>
inoremap Jk <ESC>
inoremap JK <ESC>

" up / down during word wrap doesn't skip to next line
nnoremap j gj
nnoremap k gk

" When selecting text in visual mode,
" Delete or Backspace removes it
vmap <BS> x

" Change the directory to the current file
command! CD cd %:p:h

" Move to next / previous blank line
nnoremap <C-j> :SetCursorToNextBlankLine<CR>
nnoremap <C-k> :SetCursorToPreviousBlankLine<CR>

nnoremap <Space>n :noh<CR>

nnoremap <M-b> <cmd>Telescope buffers<cr>
" <M-p> is set in after/plugin/telescope.vim with wildignore support
" <M-j> is set in after/plugin/telescope.vim and after/plugin/treesitter.vim

nnoremap <M-m> :BuildProject<CR>

nnoremap <M-n> :cn<CR>
nnoremap <M-N> :cp<CR>
nnoremap <M-f> :e <C-r>=expand('%:p:h')<CR>\

"
"      --- Gui Settings ---
" -----------------------------------------------------------------
if exists("g:neovide")
	let g:neovide_cursor_animation_length = 0
    let g:neovide_scroll_animation_length = 0.0
    let g:neovide_position_animation_length = 0.0

    let g:neovide_input_macos_option_key_is_meta = 'only_left'
    let g:neovide_font_features = "-liga"
    set guifont=Liberation\ Mono:h12
endif

"
"      --- Settings ---
" -------------------------------------------------
set splitright             " Puts new v-split to the right of the current
set splitbelow             " Puts new split windows to the bottom
set ignorecase             " Case insensitive searches
set incsearch              " Incremental searches
set smartcase              " Case sensitive when wanted
set nohlsearch               " Highlight all the search results
highlight       Search    ctermfg=Red ctermbg=Yellow guifg=Red guibg=Yellow

set tabstop=4              " Tab Stop at 4 unless plugin overwrites it
set softtabstop=4          " When inserting a tab how many spaces to input
set shiftwidth=4
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
    set undodir=$HOME/.vim/.VIM_UNDO_FILES
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
set wildignore+=*/.venv/**
set wildignore+=*.swp
set wildignore+=*.bak

" Re-add these since i want my fuzzy finder to find them
set wildignore-=*.thrift
set wildignore-=*.sql

" NOTE: don't get rid of this
:noh
