" Key Bindings
" ================================================
let mapleader = "\<Space>"

" When you save the vimrc, auto-reload it
augroup VimReload
    autocmd!
    au FocusLost * :wa
    autocmd BufWritePost  $MYVIMRC  source $MYVIMRC
augroup END

" undo all the things
if has('persistent_undo')
    set undolevels=5000
    set undodir=$HOME/.VIM_UNDO_FILES
    set undofile
endif

" After doing a search, hitting 'CTRL-f-f' will fold all the results for easier
" display
nmap <silent> <expr>  <C-f><C-f>  FS_ToggleFoldAroundSearch({'context':1})

" map S to auto fill the search / replace
nmap S :%s/\v/gc<LEFT><LEFT><LEFT>

" Don't use escape
nnoremap <Esc> <Nop>
inoremap <Esc> <Nop>

" Easy opening of splits
nnoremap vs :vs<CR>
nnoremap sp :sp<CR>

" Open up the buffer list and wait for input
nnoremap gb :ls<CR>:b<Space>
nnoremap <leader>ls :ls<CR>:b<Space>

" Change two vertical splits to horizontal splits
nnoremap <leader>sp <C-w>t<C-w>K

" Change two horizontal splits to vertical splits
nnoremap <leader>vs <C-w>t<C-w>H

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Escape to normal mode from insert mode with jj
inoremap jj <ESC>
inoremap jk <ESC>

" Increase split size by 5
nnoremap = :vertical resize +5<CR>
nnoremap + :resize +5<CR>

" git related commands
nnoremap ga :Gblame<CR>

" File navigation and IDE like settings
nnoremap <leader>7 :TagbarToggle<CR>

" Jump to definition, <C-t> jumps back
nnoremap <C-b> g]

" Buffer navigation
nnoremap gb :ls<CR>:buffer<Space>
nnoremap gB :ls<CR>:sbuffer<Space>

" Code Completion
inoremap <C-Space> <C-x><C-o>

" Turn off that stupid highlight search
nnoremap <silent> <leader>n :nohls<CR>

" Underline the current line with '='
nnoremap <silent> <leader>u= :t.\|s/./=/g\|:nohls<cr>
nnoremap <silent> <leader>u- :t.\|s/./-/g\|:nohls<cr>
nnoremap <silent> <leader>u~ :t.\|s/./\\~/g\|:nohls<cr>

" Move splits with just CTRL-HJKL
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l

" ================================================
" Plugin Settings
" ================================================
let g:scala_use_default_keymappings = 0

nnoremap <leader>t :CtrlPTag<CR>
nnoremap <leader>p :CtrlPTag<CR>
nnoremap <leader>f :CtrlP<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPTag'
let g:ctrlp_working_path_mode = 'ra'

" Open/Close NERDTree
nnoremap - :NERDTreeToggle<CR>
nnoremap _ :NERDTreeFind<CR>
let NERDTreeHijackNetrw=1
let NERDTreeQuitOnOpen=1

" tags
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_name = 'tags'
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'

" Ensime settings
augroup EnsimeTypeCheck
    autocmd!
    autocmd BufWritePost *.scala silent :EnTypeCheck
augroup END

augroup ScalaAutoCommmands
    autocmd!
    autocmd BufWritePost *.scala %s/\s\+$//e
augroup END

nnoremap <leader>et :EnType<CR>
nnoremap <leader>ed :EnDeclaration<CR>

" Syntastic Settings
let g:syntastic_always_populate_loc_list = 1
" let g:syntastic_auto_loc_list = 1
let g:syntastic_check_on_open = 1
let g:syntastic_check_on_wq = 0

" Completion
let g:EclimCompletionMethod = 'omnifunc'
set omnifunc=syntaxcomplete#Complete

" Markdown Preview
let g:mkdp_path_to_chrome = "open -a Safari"
nnoremap <leader>md :MarkdownPreview<CR>

" SLIME for REPL
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

" vim-markdown
let g:markdown_mapping_switch_status = '<Leader>ms'

" ==================================================
" Plugins
" ==================================================
call plug#begin()

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
" Plug 'majutsushi/tagbar' // @deprecated
Plug 'vim-scripts/BufOnly.vim'
Plug 'airblade/vim-gitgutter'
Plug 'soramugi/auto-ctags.vim'
" Plug 'xolox/vim-misc'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'scrooloose/nerdtree'
Plug 'christoomey/vim-tmux-navigator'
Plug 'iamcco/markdown-preview.vim'

" Scala Plugins
Plug 'derekwyatt/vim-scala'
Plug 'derekwyatt/vim-sbt'
Plug 'spiroid/vim-ultisnip-scala'
Plug 'ensime/ensime-vim'
Plug 'solarnz/thrift.vim'
Plug 'jpalardy/vim-slime'

" Colorschemes
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'xoria256.vim'
Plug 'flazz/vim-colorschemes'
Plug 'jpo/vim-railscasts-theme'

" Testing these plugins
Plug 'tpope/vim-speeddating'
Plug 'wesQ3/vim-windowswap'     " <- Use via <leader>ww -> <leader>ww
Plug 'tpope/vim-projectionist'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'scrooloose/syntastic'
Plug 'Valloric/YouCompleteMe'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'jiangmiao/auto-pairs'

call plug#end()

" ==================================================
" Settings
" ==================================================
if has('gui_running')
    " NOTE: sometimes i swap between colorschemes.
    set background=light
    colorscheme macvim
else
    set background=light
    colorscheme tpope
endif

function! ToggleColorscheme()
    if (g:colors_name == "tpope")
        set background=dark
        colorscheme xoria256
    else
        set background=light
        colorscheme tpope
    endif
endfunction
command! TC call ToggleColorscheme()

" function! RemoveTrailingWhitespaces()
"   :%s/\s\+$//e
" endfunction
" command! RemoveTrailingWhitespace call RemoveTrailingWhitespaces()

set list                " Makes the whitespace visible
set listchars=tab:⇒·,trail:␣,nbsp:~",extends:¬
set guifont=Menlo:h12
set splitright          " Puts new v-split to the right of the current
set splitbelow          " Puts new split windows to the bottom
set nu                  " Always show line numbers
set ignorecase          " Case insensitive searches
set incsearch           " Incremental searches
set smartcase           " Case sensitive when wanted
set hlsearch            " Highlight all the search results
set tabstop=4           " Tab Stop at 4 unless plugin overwrites it
set shiftwidth=4
set linespace=4         " Vertical line space
set expandtab           " Always use spaces instead of tabs
set autoread            " Read a file that has changed on disk
set autowrite           " Auto write to disk when buffer is changed
set autowriteall
set hidden              " Allow modified buffers in the background
set ruler
set nomodeline          " Don't allow modeline ( :help modeline )
set foldmethod=expr     " Set the current fold method to expression based

" When the page starts to scroll, keep the cursor 8 lines from the top and 8
" lines from the bottom
set scrolloff=8

" Color columns at 80 lines and 120+ lines
" set colorcolumn=120            " Sets 120 as the column limit drawdown mark
" set colorcolumn=81             " Sets 80 as the column limit drawdown mark
call matchadd('ColorColumn', '\%81v', 100)
" let &colorcolumn="81,".join(range(120,999),",")
" highlight ColorColumn ctermbg=0 guibg=magenta

set nobackup            " don't use backup files
set nowb                " don't use backup files
set noswapfile          " don't use swap files

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

let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|target)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" ==================================================
" Functions
" ==================================================
function! ScalaInsertDatabaseMigration(name)
    " silent! execute <C-R>=strftime("%Y%m%d%H%M")a:name.sql<CR>
    let a:ts = strftime("%Y%m%d%H%M")
    let a:myval = tolower(a:name)
    let a:noHyphs = substitute(a:myval, " ", "-", "g")
    let a:noSpaces = substitute(a:noHyphs, "\"", "", "g")
    let a:filename = "V1_" . a:ts . "__" . a:noSpaces . ".sql"
    echo a:filename
    echo getcwd()."/flyway/src/main/resources/db/migration/".a:filename
endfunction

command! -nargs=1 Smigration call ScalaInsertDatabaseMigration(<q-args>)

function! ScalaExtractFunction(name)
    " silent! execute <C-R>=strftime("%Y%m%d%H%M")a:name.sql<CR>
    :'<,'>x
    silent! normal i"a:name"
endfunction

command! -nargs=1 Sextract call ScalaExtractFunction(<q-args>)

function! WordProcessorMode()
  Goyo 80
  setlocal formatoptions=1
  setlocal noexpandtab
  map j gj
  map k gk
  setlocal spell spelllang=en_us
  set thesaurus+= "$HOME/.vim/thesaurus/thesaurus.txt"
  set complete+=s
  set formatprg=par
  set nonu
  setlocal wrap
  setlocal linebreak
endfunction
com! WP call WordProcessorMode()
com! WordProcessor call WordProcessorMode()


" ==================================================
" Status Line
" ==================================================
set laststatus=2

set statusline+=%m                            "modified flag
set statusline+=%r                            "read only flag
set statusline=[%t]                           "tail of the filename
set statusline+=[%{&ff}]                      "file format

set statusline+=%h                            "help file flag
set statusline+=%y                            "filetype
set statusline+=%{fugitive#statusline()}      " Git branch

set statusline+=%#warningmsg#
set statusline+=%{SyntasticStatuslineFlag()}
set statusline+=%*

" Right side
set statusline+=%=                            "left/right separator
set statusline+=%c,                           "cursor column
set statusline+=%l/%L                         "cursor line/total lines
set statusline+=\ %P                          "percent through file

