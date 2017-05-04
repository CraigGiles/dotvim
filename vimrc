" ================================================
" Testing These Settings
" ================================================
set foldmethod=indent
set foldlevelstart=1
nnoremap <leader><leader> <C-^>
let g:fzf_launcher = "~/.vim/scripts/macvimfzf.sh %s"

" ================================================
" Key Bindings
" ================================================
let mapleader = "\<Space>"

" When you save the vimrc, auto-reload it
augroup VimReload
    autocmd!
    autocmd BufWritePost  $MYVIMRC  source $MYVIMRC
augroup END

" undo all the things
if has('persistent_undo')
    set undolevels=5000
    set undodir=$HOME/.VIM_UNDO_FILES
    set undofile
endif

" After doing a search, hitting 'CTRL-f-f' will fold all
" the results for easier display
nmap <silent> <expr>  <C-f><C-f>  FS_ToggleFoldAroundSearch({'context':1})

" map S to auto fill the search / replace
nmap S :%s/\v/gc<LEFT><LEFT><LEFT>

" Easy opening of splits
nnoremap vs :vs<CR>
nnoremap sp :sp<CR>

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

" Jump to definition, <C-t> jumps back
nnoremap <C-b> g]

" Buffer navigation
nnoremap <leader>ls :ls<CR>:buffer<Space>
nnoremap <leader>lS :ls<CR>:sbuffer<Space>

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

" Make search results be in the center of the window
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

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
Plug 'vim-scripts/BufOnly.vim'
Plug 'airblade/vim-gitgutter'
Plug 'soramugi/auto-ctags.vim'
" Plug 'ctrlpvim/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
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

" Plugins for writing vimscript plugins
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/vim-UT'
Plug 'CraigGiles/scalapackage.vim'

" Testing these plugins
Plug 'tpope/vim-speeddating'
Plug 'wesQ3/vim-windowswap'     " <- Use via <leader>ww -> <leader>ww
Plug 'tpope/vim-projectionist'
Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'scrooloose/syntastic'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/vim-peekaboo'

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
set modeline            " Allow modeline ( :help modeline )
set modelines=2         " Use the first and last two lines for modeline

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

" " ==================================================
" " Functions
" " ==================================================
" function! ScalaInsertDatabaseMigration(name)
"     " silent! execute <C-R>=strftime("%Y%m%d%H%M")a:name.sql<CR>
"     let a:ts = strftime("%Y%m%d%H%M")
"     let a:myval = tolower(a:name)
"     let a:noHyphs = substitute(a:myval, " ", "-", "g")
"     let a:noSpaces = substitute(a:noHyphs, "\"", "", "g")
"     let a:filename = "V1_" . a:ts . "__" . a:noSpaces . ".sql"
"     echo a:filename
"     echo getcwd()."/flyway/src/main/resources/db/migration/".a:filename
" endfunction

" command! -nargs=1 Smigration call ScalaInsertDatabaseMigration(<q-args>)

" function! ScalaExtractFunction(name)
"     " silent! execute <C-R>=strftime("%Y%m%d%H%M")a:name.sql<CR>
"     :'<,'>x
"     silent! normal i"a:name"
" endfunction

" command! -nargs=1 Sextract call ScalaExtractFunction(<q-args>)




" ==================================================
" TAKEN SHAMELESSLY FROM WINCENT
" ==================================================
" if v:progname == 'vi'
"   set noloadplugins
" endif

" let mapleader="\<Space>"
" let maplocalleader="\\"

" " Extension -> filetype mappings.
" let filetype_m='objc'
" let filetype_pl='prolog'

" " Stop annoying paren match highlighting from flashing all over the screen.
" let loaded_matchparen=1

" " Automatic, language-dependent indentation, syntax coloring and other
" " functionality.
" filetype indent plugin on
" syntax on

" source $VIMRUNTIME/macros/matchit.vim

" " Stark highlighting is enough to see the current match; don't need the
" " centering, which can be annoying.
" let g:LoupeCenterResults=0

" " Would be useful mappings, but they interfe with my default window movement
" " bindings (<C-j> and <C-k>).
" let g:NERDTreeMapJumpPrevSibling='<Nop>'
" let g:NERDTreeMapJumpNextSibling='<Nop>'

" " Prevent tcomment from making a zillion mappings (we just want the operator).
" let g:tcommentMapLeader1=''
" let g:tcommentMapLeader2=''
" let g:tcommentMapLeaderCommentAnyway=''
" let g:tcommentTextObjectInlineComment=''

" " The default (g<) is a bit awkward to type.
" let g:tcommentMapLeaderUncommentAnyway='gu'

" " Allow for per-machine overrides in ~/.vim/host/hostname and
" " ~/.vim/vimrc.local.
" let s:hostfile = $HOME . '/.vim/host/' . substitute(hostname(), "\\..*", '', '')
" if filereadable(s:hostfile)
"   execute 'source ' . s:hostfile
" endif

" " Inglorious hack to share config across dev* machines.
" if matchstr(hostname(), '\v^dev(vm)?\d+\.') != ''
"   execute 'source ' . $HOME . '/.vim/host/dev-star'
" endif

" let s:vimrc_local = $HOME . '/.vim/vimrc.local'
" if filereadable(s:vimrc_local)
"   execute 'source ' . s:vimrc_local
" endif

" " Temporary workaround for MacVim blowing up for any Python plug-in.
" if has('gui')
"   let g:pathogen_blacklist=['YouCompleteMe', 'ultisnips']
" endif

" if &loadplugins
"   if has('packages')
"     packloadall
"   else
"     " Use Pathogen for plug-in loading.
"     source $HOME/.vim/pack/bundle/opt/vim-pathogen/autoload/pathogen.vim
"     call pathogen#infect('pack/bundle/start/{}')
"   endif
" endif

" After this file is sourced, plug-in code will be evaluated.
" See ~/.vim/after for files evaluated after that.
" See `:scriptnames` for a list of all scripts, in evaluation order.
" Launch Vim with `vim --startuptime vim.log` for profiling info.
"
" To see all leader mappings, including those from plug-ins:
"
"   vim -c 'set t_te=' -c 'set t_ti=' -c 'map <space>' -c q | sort
