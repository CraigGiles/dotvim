" ==================================================
" Settings
" ==================================================
if has('gui_running')
    " NOTE: sometimes i swap between colorschemes.
    set background=dark
    " colorscheme macvim
    colorscheme darkula
else
    " set background=light
    " colorscheme tpope
    set background=dark
    colorscheme zenburn
endif


set list                " Makes the whitespace visible
set listchars=tab:⇒·,trail:␣,nbsp:~",extends:¬
" set guifont=Menlo:h12
set splitright          " Puts new v-split to the right of the current
set splitbelow          " Puts new split windows to the bottom
set nu                  " Always show line numbers
set ignorecase          " Case insensitive searches
set incsearch           " Incremental searches
set smartcase           " Case sensitive when wanted
set hlsearch            " Highlight all the search results
highlight clear Search
highlight       Search    ctermfg=Red ctermbg=Yellow

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
set foldmethod=indent   " Set the fold method to be based on the indentation
set foldlevelstart=15   " Set the foldlevel start at a high enough number
set mouse=a             " Use the mouse for things like resizing windows
set matchpairs+=<:>,«:» " Add additional pairs to be matched on
set noshowmode          " Doesn't show what mode you're in

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

" " Sets the timeout length for how long we'll 'pause' when waiting for a
" " keypress after leader key
" set timeoutlen=1000

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
