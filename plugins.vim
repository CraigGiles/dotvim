call plug#begin()

" -------------------------------------------------
"     General Plugins
" =================================================
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-dispatch'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jreybert/vimagit'
Plug 'rking/ag.vim'
Plug 'tpope/vim-vinegar'

Plug 'vim-scripts/BufOnly.vim'

" Vim GO
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

" -------------------------------------------------
"     Scala Plugins
" =================================================
Plug 'derekwyatt/vim-sbt'
Plug 'derekwyatt/vim-scala'
Plug 'craiggiles/scala.vim'
" Plug 'GEverding/vim-hocon'    " do i really need this
" Plug 'solarnz/thrift.vim'     " do i really need this

" -------------------------------------------------
"     Colorschemes
" =================================================
Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'jpo/vim-railscasts-theme'

" -------------------------------------------------
"     Plugin Development Helpers
" =================================================
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/vim-UT'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-speeddating'

" -------------------------------------------------
"     Word Documents
" =================================================
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'iamcco/markdown-preview.vim'

call plug#end()
