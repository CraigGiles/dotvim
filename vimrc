colorscheme nosyntax

source ~/.vim/functions.vim
source ~/.vim/statusline.vim
source ~/.vim/fixme_colors.vim

"
"      --- Plugins ---
" -------------------------------------------------
call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-vinegar'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'rking/ag.vim'
Plug 'skywind3000/asyncrun.vim'

Plug 'tpope/vim-commentary'
Plug 'vim-scripts/BufOnly.vim'
call plug#end()

" ctrlp
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|target)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" the_silver_searcher
let g:ags_enable_async = 1
let g:ag_working_path_mode="r"

"
"      --- Auto Groups ---
" -------------------------------------------------
augroup auto_make_directory
    autocmd! auto_make_directory
    autocmd  BufNewFile  *  :call EnsureDirExists()
augroup END

augroup markdown_mode
    autocmd! markdown_mode
    autocmd Filetype markdown source ~/.vim/fixme_colors.vim
augroup end

augroup ags_mode
    autocmd! ags_mode
    autocmd Filetype agsv nmap <buffer> <D-n> :AgsNextResult<CR>
    autocmd Filetype agsv nmap <buffer> <D-N> :AgsPrevResult<CR>
augroup end

" When the quickfix buffer gets opened
augroup quickfix
    autocmd!
    " autocmd QuickFixCmdPost [^l]* call OpenQuickFixList()
augroup END

augroup go_mode
    autocmd! go_mode
    autocmd Filetype go nmap <buffer> <C-b> :GoDef<CR>

    " Debug
    autocmd Filetype go nmap <buffer> <F5> :GoDebugStart<CR>
    autocmd Filetype go nmap <buffer> <F9> :GoDebugBreakpoint<CR>
    autocmd Filetype go nmap <buffer> <F10> :GoDebugNext<CR>
    autocmd Filetype go nmap <buffer> <F11> :GoDebugStep<CR>
    autocmd Filetype go nmap <buffer> <F12> :GoDebugStepOut<CR>
augroup end

augroup all_filetypes
    autocmd Filetype * source ~/.vim/fixme_colors.vim
augroup end

augroup vimrc_mode
    autocmd! vimrc_mode
    autocmd bufwritepost vimrc source $MYVIMRC
    autocmd bufwritepost .vimrc source $MYVIMRC
augroup end

"
"      --- Font and vimrc.local ---
" -------------------------------------------------
if has('gui_macvim')
  set guifont=Liberation\ Mono:h12

  " Don't have scroll bars
  set guioptions=
endif

let s:vimrc_local = $HOME . '/.vim/vimrc.local'
if filereadable(s:vimrc_local)
  execute 'source ' . s:vimrc_local
endif

"
"      --- Key Bindings ---
" -------------------------------------------------
nnoremap <Space>ed :e ~/.vim/vimrc<CR>

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

" Turn off that stupid highlight search
nnoremap <silent> <Space>n :noh<CR>

" When selecting text in visual mode,
" Delete or Backspace removes it
vmap <BS> x

" Move to next / previous blank line
nnoremap <C-j> :SetCursorToNextBlankLine<CR>
nnoremap <C-k> :SetCursorToPreviousBlankLine<CR>

" Change split orientation from | to -
nnoremap <Space>sp :RotateSplits<CR>
nnoremap <Space>vs :RotateSplits<CR>

" cmd f opens up the file list
if has('gui_macvim')
    nnoremap <C-f> :call SearchCodebase()<CR>
    nnoremap <D-f> :CtrlP<CR>
    nnoremap <D-m> :MakeWithoutAsking<CR>
    nnoremap <D-n> :cnext<CR>
    nnoremap <D-N> :cprev<CR>
    nnoremap <D-p> :CtrlP<CR>
    nnoremap <D-b> :CtrlPBuffer<CR>
    nnoremap <D-6> :OtherWindowVertical<CR><C-^>
endif

if has('gui_vimr')
    nnoremap <C-f> :call SearchCodebase()<CR>
    nnoremap <D-f> :CtrlP<CR>
    nnoremap <D-m> :MakeWithoutAsking<CR>
    nnoremap <D-n> :cnext<CR>
    nnoremap <D-N> :cprev<CR>
    nnoremap <D-p> :CtrlP<CR>
    nnoremap <D-b> :CtrlPBuffer<CR>
    nnoremap <D-6> :OtherWindowVertical<CR><C-^>
endif

"
"      --- Settings ---
" -------------------------------------------------
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

" NOTE: don't get rid of this
:noh

if has("gui_running")
  " use the terminal colors
  set t_Co=0
endif

" vim:set sw=2 sts=2 foldmethod=marker foldlevel=0:
