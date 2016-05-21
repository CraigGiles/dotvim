" ==================================================
" Key Bindings
" =================================================

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
inoremap <leader>cn <c-r>=expand('%:t:r')<cr>

" Turn off that stupid highlight search
nnoremap <silent> <leader>n :nohls<CR>

" Underline the current line with '='
nnoremap <silent> <leader>u= :t.\|s/./=/g\|:nohls<cr>
nnoremap <silent> <leader>u- :t.\|s/./-/g\|:nohls<cr>
nnoremap <silent> <leader>u~ :t.\|s/./\\~/g\|:nohls<cr>

" ==================================================
" Plugin Settings
" ==================================================

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
let g:lightline = {
      \ 'colorscheme': 'wombat',
      \ 'active': {
      \   'left': [
      \     [ 'readonly', 'fugitive', 'filename', 'modified' ] 
      \   ]
      \ },
      \ 'component': {
      \   'fugitive': '%{exists("*fugitive#head")?fugitive#head():""}'
      \ },
      \ }

" CtrlP settings
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlP'
let g:ctrlp_working_path_mode = 'ra'

" ENSIME settings
" autocmd BufWritePost *.scala :EnTypeCheck
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
Plug 'Shougo/unite.vim'
Plug 'tsukkee/unite-tag'
Plug 'derekwyatt/vim-scala'
Plug 'derekwyatt/vim-sbt'
Plug 'altercation/vim-colors-solarized'
Plug 'majutsushi/tagbar'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/BufOnly.vim'
Plug 'airblade/vim-gitgutter'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'itchyny/lightline.vim'
Plug 'soramugi/auto-ctags.vim'
Plug 'ensime/ensime-vim'
Plug 'scrooloose/syntastic'

Plug 'spiroid/vim-ultisnip-scala'

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
set colorcolumn=120            " Sets 120 as the column limit drawdown mark
set colorcolumn=81             " Sets 80 as the column limit drawdown mark
let &colorcolumn="81,".join(range(120,999),",")

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
