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
Plug 'vim-scripts/BufOnly.vim'
Plug 'airblade/vim-gitgutter'
Plug 'soramugi/auto-ctags.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
if has("gui_macvim")
  Plug 'ctrlpvim/ctrlp.vim'
else
  Plug 'junegunn/fzf.vim'
endif
Plug 'christoomey/vim-tmux-navigator'
Plug 'junegunn/vim-peekaboo'
Plug 'nixon/vim-vmath'
Plug 'wesQ3/vim-windowswap'     " <- Use via <leader>ww -> <leader>ww
Plug 'tpope/vim-endwise'
Plug 'elzr/vim-json'
Plug 'xtal8/traces.vim'

""}}}
""{{{ Scala Plugins 

Plug 'derekwyatt/vim-sbt'
Plug 'craiggiles/scala.vim'
Plug 'derekwyatt/vim-scala'
" Plug 'ensime/ensime-vim', { 'do': ':UpdateRemotePlugins' }
Plug 'solarnz/thrift.vim'
Plug 'jpalardy/vim-slime'
Plug 'GEverding/vim-hocon'

"" }}}
""{{{ Colorschemes

Plug 'altercation/vim-colors-solarized'
Plug 'morhetz/gruvbox'
Plug 'xoria256.vim'
Plug 'flazz/vim-colorschemes'
Plug 'jpo/vim-railscasts-theme'

""}}}
""{{{ Plugins for writing vimscript plugins

Plug 'LucHermitte/lh-vim-lib'
Plug 'LucHermitte/vim-UT'
Plug 'tpope/vim-scriptease'
Plug 'tpope/vim-speeddating'

""}}}
""{{{ Document Writing

Plug 'vim-pandoc/vim-pandoc'
Plug 'vim-pandoc/vim-pandoc-syntax'
Plug 'reedes/vim-pencil'
Plug 'junegunn/goyo.vim'
Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.vim'

""}}}
""{{{ Testing these plugins
" Code completion
if has('nvim')
  Plug 'Shougo/deoplete.nvim', { 'do': ':UpdateRemotePlugins' }
  Plug 'eed3si9n/LanguageClient-neovim', { 'do': ':UpdateRemotePlugins' }
else
  Plug 'Shougo/deoplete.nvim'
  Plug 'roxma/nvim-yarp'
  Plug 'roxma/vim-hug-neovim-rpc'
endif
Plug 'artur-shaik/vim-javacomplete2'

Plug 'Shougo/echodoc.vim'
Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'

"}}}
call plug#end()
" vim:set sw=2 sts=2 foldmethod=marker:
