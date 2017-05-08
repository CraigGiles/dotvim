" ==================================================
" Plugins
" ==================================================
call plug#begin()
"{{{ General Plugins

Plug 'tpope/vim-sensible'
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-eunuch'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-unimpaired'
Plug 'tpope/vim-dispatch'
Plug 'tpope/vim-vinegar'
Plug 'scrooloose/nerdtree'
Plug 'vim-scripts/BufOnly.vim'
Plug 'airblade/vim-gitgutter'
Plug 'soramugi/auto-ctags.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
Plug 'junegunn/fzf.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/vim-peekaboo'
Plug 'nixon/vim-vmath'
Plug 'wesQ3/vim-windowswap'     " <- Use via <leader>ww -> <leader>ww
Plug 'tpope/vim-endwise'

"}}}
"{{{ Scala Plugins 

Plug 'derekwyatt/vim-sbt'
Plug 'craiggiles/scala.vim'
Plug 'ensime/ensime-vim'
Plug 'solarnz/thrift.vim'
Plug 'jpalardy/vim-slime'

" }}}
"{{{ Colorschemes

Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'xoria256.vim'
Plug 'flazz/vim-colorschemes'
Plug 'jpo/vim-railscasts-theme'

"}}}
"{{{ Plugins for writing vimscript plugins

Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/vim-UT'

"}}}
"{{{ Document Writing

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.vim'

"}}}
"{{{ Testing these plugins

Plug 'tpope/vim-speeddating'
Plug 'tpope/vim-projectionist'
Plug 'scrooloose/syntastic'

"}}}
call plug#end()

" vim:set sw=2 sts=2 foldmethod=marker:
