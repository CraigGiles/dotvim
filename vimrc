" ==================================================
" Key Bindings
" =================================================
let mapleader = "\<Space>"

" Source the current file
nnoremap <leader>so :source %<CR>

nnoremap <C-s> :w<CR>
nnoremap <leader>y "*y
nnoremap <leader>p "*p

" Unite key bindings
nnoremap <leader>t :Unite -start-insert tag<CR>
nnoremap <leader>f :<C-u>Unite -start-insert file_rec<CR>
nnoremap <leader>ls :Unite buffer<CR>

" Easy opening of splits
nnoremap vs :vs<CR>
nnoremap sp :sp<CR>

" Change two vertical splits to horizontal splits
nnoremap <leader>sp <C-w>t<C-w>K

" Change two horizontal splits to vertical splits
nnoremap <leader>vs <C-w>t<C-w>H

" Easy open and source of vimrc
nnoremap <leader>ed :vs ~/.vimrc<CR>
nnoremap <leader>sv :source ~/.vimrc<CR>

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Escape to normal mode from insert mode with jj
inoremap jj <ESC>

" Increase vertical split size by 5
nnoremap + :resize +5<CR>
nnoremap <leader>+ :resize +5<CR>

" git related commands
nnoremap ga :Gblame<CR>

" highlight all the things
nnoremap <leader>a ggVG

" File navigation and IDE like settings
nnoremap <leader>1 :NERDTreeToggle<CR>
nnoremap <leader>2 :NERDTreeFind<CR>
nnoremap <leader>7 :TagbarToggle<CR>

" Jump to definition, <C-t> jumps back
nnoremap <C-b> g]

" Buffer navigation
nnoremap gb :ls<CR>:buffer<Space>
nnoremap gB :ls<CR>:sbuffer<Space>
nnoremap ,b :buffer *
nnoremap ,B :sbuffer *

" Code Completion
inoremap <C-Space> <C-x><C-o>

" insert the class name into the current location
inoremap <C-space>cn <c-r>=expand('%:t:r')<cr>

" Turn off that stupid highlight search
nnoremap <silent> <leader>n :nohls<CR>

" Underline the current line with '='
nnoremap <silent> <leader>u= :t.\|s/./=/g\|:nohls<cr>
nnoremap <silent> <leader>u- :t.\|s/./-/g\|:nohls<cr>
nnoremap <silent> <leader>u~ :t.\|s/./\\~/g\|:nohls<cr>

" ==================================================
" Plugin Settings
" ==================================================
let g:tmux_navigator_no_mappings = 1

nnoremap <silent> <C-h> :TmuxNavigateLeft<cr>
nnoremap <silent> <C-j> :TmuxNavigateDown<cr>
nnoremap <silent> <C-k> :TmuxNavigateUp<cr>
nnoremap <silent> <C-l> :TmuxNavigateRight<cr>

let g:project_use_nerdtree = 1
let g:scala_use_default_keymappings = 0

" Close NERDTree when opening a file
let NERDTreeQuitOnOpen = 0

" tags
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_name = 'tags'
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'

set laststatus=2
" let g:lightline = {
"       \ 'colorscheme': 'wombat',
"       \ 'active': {
"       \   'left': [
"       \     [ 'readonly', 'fugitive', 'filename', 'modified' ]
"       \   ]
"       \ },
"       \ 'component': {
"       \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
"       \ },
"       \ }

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" ENSIME settings
nnoremap <leader>et :EnType<CR>
au FileType scala nnoremap <leader>ed :EnDeclaration<CR>
au FileType scala nnoremap <leader>ei :EnSuggestImport<CR>

" ==================================================
" Plugins
" ==================================================
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-scriptease'
Plug 'Shougo/unite.vim'
Plug 'tsukkee/unite-tag'
Plug 'derekwyatt/vim-scala'
Plug 'derekwyatt/vim-sbt'
Plug 'altercation/vim-colors-solarized'
Plug 'majutsushi/tagbar'
" Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/BufOnly.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
" Plug 'itchyny/lightline.vim'
Plug 'soramugi/auto-ctags.vim'
Plug 'ensime/ensime-vim'
Plug 'scrooloose/syntastic'
Plug 'spiroid/vim-ultisnip-scala'
Plug 'christoomey/vim-tmux-navigator'

call plug#end()


" ==================================================
" Settings
" ==================================================
set background=dark
colorscheme darkula

set list                        " Makes the whitespace visible
set guifont=Menlo:h12
set splitright                  " Puts new v-split to the right of the current
set splitbelow                  " Puts new split windows to the bottom
set nu                          " Always show line numbers
set ignorecase                  " Case insensitive searches
set smartcase                   " Case sensitive when wanted
set tabstop=4                   " Tab Stop at 4 unless plugin overwrites it
set shiftwidth=4
set expandtab                   " Always use spaces instead of tabs
set autoread                    " Read a file that has changed on disk
set autowrite                   " Auto write to disk when buffer is changed
set autowriteall
set hidden                      " Allow modified buffers in the background
set ruler
set nomodeline                  " Don't allow modeline ( :help modeline )

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Color columns at 80 lines and 120+ lines
" set colorcolumn=120            " Sets 120 as the column limit drawdown mark
" set colorcolumn=81             " Sets 80 as the column limit drawdown mark
" let &colorcolumn="81,".join(range(120,999),",")
highlight ColorColumn ctermbg=0 guibg=magenta

" Color column line 81 and 121-130
call matchadd('ColorColumn', '\%81v', 100)
call matchadd('ColorColumn', '\%121v', 100)
call matchadd('ColorColumn', '\%122v', 100)
call matchadd('ColorColumn', '\%123v', 100)
call matchadd('ColorColumn', '\%124v', 100)
call matchadd('ColorColumn', '\%125v', 100)
call matchadd('ColorColumn', '\%126v', 100)
call matchadd('ColorColumn', '\%127v', 100)
call matchadd('ColorColumn', '\%128v', 100)
call matchadd('ColorColumn', '\%129v', 100)
call matchadd('ColorColumn', '\%130v', 100)

set nobackup                    " don't use backup files
set nowb                        " don't use backup files
set noswapfile                  " don't use swap files

" Sets the timeout length for how long we'll 'pause' when waiting for a
" keypress after leader key
set timeoutlen=1000

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


" ==================================================
" Functions
" ==================================================
"=====[ Always syntax highlight .patch and ToDo and .itn files ]===============

augroup PatchHighlight
    autocmd!
    autocmd BufEnter  *.patch,*.diff  let b:syntax_was_on = exists("syntax_on")
    autocmd BufEnter  *.patch,*.diff  syntax enable
    autocmd BufLeave  *.patch,*.diff  if !getbufvar("%","syntax_was_on")
    autocmd BufLeave  *.patch,*.diff      syntax off
    autocmd BufLeave  *.patch,*.diff  endif
augroup END

augroup TODOHighlight
    autocmd!
    autocmd BufEnter  *.todo,todo,ToDo,TODO  let b:syntax_was_on = exists("syntax_on")
    autocmd BufEnter  *.todo,todo,ToDo,TODO  syntax enable
    autocmd BufLeave  *.todo,todo,ToDo,TODO  if !getbufvar("%","syntax_was_on")
    autocmd BufLeave  *.todo,todo,ToDo,TODO      syntax off
    autocmd BufLeave  *.todo,todo,ToDo,TODO  endif
augroup END

augroup ITNHighlight
    autocmd!
    autocmd BufEnter  *.itn   let b:syntax_was_on = exists("syntax_on")
    autocmd BufEnter  *.itn   syntax enable
    autocmd BufEnter  *.itn   set syntax=itn
    autocmd BufLeave  *.itn   if !getbufvar("%","syntax_was_on")
    autocmd BufLeave  *.itn       syntax off
    autocmd BufLeave  *.itn   endif
augroup END

function! WindowNumber()
  return tabpagewinnr(tabpagenr())
endfunction
function! TrailingSpaceWarning()
  if !exists("b:statline_trailing_space_warning")
    let lineno = search('\s$', 'nw')
    if lineno != 0
      let b:statline_trailing_space_warning = 'Trailing:'.lineno.''
    else
      let b:statline_trailing_space_warning = 'Trailing: None'
    endif
  endif
  return b:statline_trailing_space_warning
endfunction

" recalculate when idle, and after saving
augroup statline_trail
  autocmd!
  autocmd cursorhold,bufwritepost * unlet! b:statline_trailing_space_warning
augroup END

set statusline=
set statusline+=%6*%m%r%*                          " modified, readonly
set statusline+=
set statusline+=%{fugitive#statusline()}           " Git branch
set statusline+=[
set statusline+=%1*%t%*                            " file name
set statusline+=][
set statusline+=%<                                 " truncate here if needed
set statusline+=][
set statusline+=%3*%{TrailingSpaceWarning()}%*     " trailing whitespace
set statusline+=]

set statusline+=%=                                 " switch to RHS

set statusline+=[
set statusline+=%1*%{expand('%:h')}%*              " relative path to file's directory"
set statusline+=][
set statusline+=%5*col:%-3.c%*                      " column
set statusline+=][
set statusline+=%2*buf:%-3n%*                      " buffer number
set statusline+=][
set statusline+=%2*win:%-3.3{WindowNumber()}%*     " window number
set statusline+=]
