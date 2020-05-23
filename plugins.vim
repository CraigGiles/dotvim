call plug#begin()

"
"     --- General Plugins ---
" -------------------------------------------------
Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
" Plug 'tpope/vim-dispatch'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'jreybert/vimagit'
Plug 'rking/ag.vim'
Plug 'tpope/vim-vinegar'
Plug 'tpope/vim-projectionist'
Plug 'vim-scripts/BufOnly.vim'
Plug 'skywind3000/asyncrun.vim'

" TODO do i need vim-go?
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }

"
"     --- Scala Plugins ---
" -------------------------------------------------
Plug 'derekwyatt/vim-sbt'
Plug 'derekwyatt/vim-scala'
Plug 'craiggiles/scala.vim'

"
"     --- Plugin Development Helpers ---
" -------------------------------------------------
Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/vim-UT'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-speeddating'

"
"     --- Word Documents ---
" -------------------------------------------------
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'iamcco/markdown-preview.vim'

call plug#end()
