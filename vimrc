colorscheme gilesc

source ~/.vim/statusline.vim
source ~/.vim/functions.vim
source ~/.vim/fixme_colors.vim

call plug#begin()
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-scriptease'

Plug 'ctrlpvim/ctrlp.vim'
Plug 'tacahiroy/ctrlp-funky'

Plug 'rking/ag.vim'

" Development Environments
Plug 'fatih/vim-go'
Plug 'udalov/kotlin-vim'
Plug 'jansedivy/jai.vim'

" Unused plugins, for now
" Plug 'skywind3000/asyncrun.vim'
" Plug 'derekwyatt/vim-fswitch'
" Plug 'vim-scripts/BufOnly.vim'

" Plug 'vim-airline/vim-airline'
" Plug 'vim-airline/vim-airline-themes'

call plug#end()

"
"      --- 'Platform' layer ---
" -------------------------------------------------
" set lines=1000
" set columns=120

" the_silver_searcher
let g:ags_enable_async = 1
let g:ag_working_path_mode="r"
let g:tagbar_vertical = 30
let g:tagbar_left = 0

" ctrlp
let g:ctrlp_cmd = 'CtrlP'
" let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_working_path_mode = 0
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|target)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

"
"      --- Key Bindings ---
" -------------------------------------------------
nnoremap <Space>ed :e ~/.vim/vimrc<CR>
nnoremap <Space>es :source ~/.vim/vimrc<CR>

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

nnoremap <C-j> }
nnoremap <C-k> {

" Turn off that stupid highlight search
nnoremap <silent> <Space>n :noh<CR>

" Search the codebase for the word under cursor
nnoremap <C-f> :call SearchCodebase(expand('<cword>'))<CR>
nnoremap co :OpenQuickfixInOtherWindow<CR>


"
"      --- OS Specific Key Bindings ---
" -------------------------------------------------
"  NOTE: any key binding that uses the <CMD> or the <ALT> key needs to be
"  bound using the BindCommandOrMetaKey function. This will ensure the proper
"  prefix is applied at the binding time. 
"
"  Just note, that this is kind of disgusting.
"                                                         gilesc 03/15/2022
" -------------------------------------------------
if has('macunix')
    let g:gui_prefix = "D"
elseif has('win32')
    let g:gui_prefix = "A"
endif
func! BindCommandOrMetaKey(mode, key, command)
    exe a:mode . ' ' . '<' . g:gui_prefix . '-' . a:key . '> ' . a:command
endfunction

call BindCommandOrMetaKey("nnoremap", "l", ':echo "Hello, Wonderful"<CR>')
call BindCommandOrMetaKey("nnoremap", "j", ':CtrlPFunky<CR>')
call BindCommandOrMetaKey("nnoremap", "b", ':CtrlPBuffer<CR>')
call BindCommandOrMetaKey("nnoremap", "p", ':CtrlP<CR>')
call BindCommandOrMetaKey("nnoremap", "m", ':MakeWithoutAsking<CR>')
call BindCommandOrMetaKey("nnoremap", "f", ':CtrlP<CR>')

" Change the directory to the current file
command! CD cd %:p:h

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
set foldlevel=10           " Start out without a lot of folds
set autochdir

" undo all the things
if has('persistent_undo')
    set undolevels=5000
    set undodir=$HOME/.vim/.VIM_UNDO_FILES
    set undofile
endif

" This creates a new Help command and binds it to <C-h> which will open the
" help window in the OtherWindowVertical (see functions.vim) and allow the
" C-^ command to be used in order to go to previous the buffer
"
" TODO(craig) make a HelpBuffer function maybe actually take some arguments
command! -nargs=1 -complete=help Help :enew | :set buftype=help | :keepalt h <args>
nnoremap <C-h> :OtherWindowVertical<CR>:Help 

set guioptions+=!

" NOTE: don't get rid of this
:noh

" vim:set sw=2 sts=2 foldmethod=marker foldlevel=0:
