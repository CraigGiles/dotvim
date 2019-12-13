"
" Vim Configuration File
" Author : Craig Giles
"
" Major settings that are altered all the time are still in the vimrc file.
" Settings that are not modified often are split into their respective files.
"
" NOTE: Since i've been playing with both vim and emacs + evil, there are some
" questionable things (including mapping <C-g><C-g> to escape, and creating a
" new system command :magit and mapping that to :Magit) I may end up pulling
" out some of my more useful functions into a vim plugin at some point but for
" now i just don't see the reason.
"
" Anyway, since I'm a c, scala, and go developer, I'm not a super proficient
" at viml. Don't really look at these as good examples of what viml should be.
"
source ~/.vim/plugins.vim
source ~/.vim/plugin_settings.vim
source ~/.vim/functions.vim
source ~/.vim/statusline.vim
source ~/.vim/test_settings.vim
source ~/.vim/fixme_colors.vim

colorscheme gilesc

" -------------------------------------------------
"   Key Bindings
" =================================================
nnoremap <Space>ed :source ~/.vimrc<CR>

nmap tt :vs<CR><C-w>T
nmap <tab> za

" Exit the Ex menu without executing the command
cnoremap <C-g><C-g> <c-c>
vnoremap <C-g><C-g> <c-c>

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
nnoremap <C-j> :SetCursorToNextBlankLine<CR>
nnoremap <C-k> :SetCursorToPreviousBlankLine<CR>

" Change split orientation from | to -
nnoremap <Space>sp <C-w>t<C-w>K
nnoremap <Space>vs <C-w>t<C-w>H

" After doing a search, hitting 'CTRL-f-f' will fold all
" the results for easier display
nmap <silent> <expr>  <C-f><C-f>  FS_ToggleFoldAroundSearch({'context':1})

" command! -nargs=1 Ag :keepalt | :Ags <args>
" command! -nargs=1 -complete=help Help :enew | :set buftype=help | :keepalt h <args>
"
" This determines the placement of the search results window. It
" defaults to |bottom|. Possible values are: |top|, |bottom|, |above|,
" |below|, |far-left|, |far-right|, |left|, |right|.
" >
"     let g:ags_winplace = 'bottom'
" TODO(craig) do i REALLY need this?
function! SearchCodebase()
  let s:number_of_windows = winnr('$') 

  if s:number_of_windows == 1
    :Ag
    :RotateSplits
  elseif s:number_of_windows == 2
    " TODO(craig) if one of the splits is AG, do nothing, else persist buffer
    "   and re-use
    :Ag
  else
    :Ag
  endif
endfunction

let g:ag_working_path_mode="r"

" let g:ags_enable_async = 1
" TODO(Craig): Write a function that tells this to open in the 'other window'
"   Behavior i want to emulate is always open in the 'other-window' given a
"   two split style. If no other window is open, then open one and use it as
"   the search result. If there IS an other window, preserve its file and
"   search (allowing me to use C-^ to go back to last file)
" nnoremap <silent> <C-f> :OtherWindow<CR>:Ag<CR>
nnoremap <silent> <C-f> :call SearchCodebase()<CR>

augroup markdown_mode
  autocmd! markdown_mode
  autocmd Filetype markdown source ~/.vim/fixme_colors.vim
augroup end

augroup key_bindings_ags
  autocmd! key_bindings_ags
  autocmd Filetype agsv nmap <buffer> <D-n> :AgsNextResult<CR>
  autocmd Filetype agsv nmap <buffer> <D-N> :AgsPrevResult<CR>
augroup end

" When selecting text in visual mode, Delete or Backspace removes it
vmap <BS> x

" Turn off that stupid highlight search
nnoremap <silent> <Space>n :nohls<CR>

" Make search results be in the center of the window
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

if has('gui_macvim')
  " compile the code and open the results in a quickfix vertical split
  nnoremap <D-m> :make<CR>:copen<CR><C-w>t<C-w>H
  nnoremap <D-n> :cnext<CR>
  nnoremap <D-N> :cfirst<CR>:cnext<CR>
  nnoremap <D-p> :CtrlP<CR>
  nnoremap <D-b> :CtrlPBuffer<CR>
endif

" -------------------------------------------------
"   Language Specific Key Bindings
" =================================================
augroup key_bindings_go
  autocmd! key_bindings_go
  autocmd Filetype go nmap <buffer> <C-b> :GoDef<CR>

  " Debug
  autocmd Filetype go nmap <buffer> <F5> :GoDebugStart<CR>
  autocmd Filetype go nmap <buffer> <F9> :GoDebugBreakpoint<CR>
  autocmd Filetype go nmap <buffer> <F10> :GoDebugNext<CR>
  autocmd Filetype go nmap <buffer> <F11> :GoDebugStep<CR>
  autocmd Filetype go nmap <buffer> <F12> :GoDebugStepOut<CR>
augroup end

augroup AllFiletypeGroup
  autocmd! AllFiletypeGroup
  autocmd Filetype * aunmenu *
  autocmd Filetype * source ~/.vim/fixme_colors.vim
augroup end

" -------------------------------------------------
"   settings
" =================================================
if has('gui_macvim')
  set guifont=Liberation\ Mono:h12

  " Don't have scroll bars
  set guioptions=
endif

" Source a vimrc.local for per-machine overrides
let s:vimrc_local = $HOME . '/.vim/vimrc.local'
if filereadable(s:vimrc_local)
  execute 'source ' . s:vimrc_local
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

" NOTE: don't get rid of this
:noh

" vim:set sw=2 sts=2 foldmethod=marker foldlevel=0:
