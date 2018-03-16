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
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
" Plug 'junegunn/vim-peekaboo'
" Plug 'nixon/vim-vmath'
Plug 'wesQ3/vim-windowswap'     " <- Use via <leader>ww -> <leader>ww
Plug 'tpope/vim-endwise'
" Plug 'elzr/vim-json'
Plug 'xtal8/traces.vim'

""}}}
""{{{ Scala Plugins 

Plug 'derekwyatt/vim-sbt'
Plug 'craiggiles/scala.vim'
Plug 'derekwyatt/vim-scala'
" Plug 'ensime/ensime-vim'
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
" Plug 'scrooloose/nerdtree'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'
Plug 'justinmk/vim-dirvish'

"}}}
call plug#end()

" ================================================
" Plugin Settings
" ================================================

" ALE settings
" ================================================
" Shorten error/warning flags
let g:ale_echo_msg_error_str = 'E'
let g:ale_echo_msg_warning_str = 'W'

" custom icons for errors and warnings
let g:ale_sign_error = '✘✘'
let g:ale_sign_warning = '⚠⚠'

" Disable or enable loclist at the bottom of vim 
" Comes down to personal preferance.
let g:ale_open_list = 0
let g:ale_loclist = 0

" Setup compilers for languages
let g:ale_linters = {
      \  'cs':['syntax', 'semantic', 'issues'],
      \  'python': ['pylint'],
      \  'java': ['javac'],
      \  'scala': ['scalac']
      \ }

" CtrlP Settings
" ================================================
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <leader>p :CtrlPTag<CR>
nnoremap <leader>f :CtrlP<CR>
let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPTag'
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|target)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" Dirvish Settings
" ================================================
let g:dirvish_mode = 1
let g:dirvish_mode = ':sort ,^.*[\/],'


" NERDTree Settings
" ================================================
" " Open/Close NERDTree
" nnoremap - :NERDTreeToggle<CR>
" nnoremap _ :NERDTreeFind<CR>
" let NERDTreeHijackNetrw=1
" let NERDTreeQuitOnOpen=1

" tags
let g:auto_ctags = 1
let g:auto_ctags_directory_list = ['.git', '.svn']
let g:auto_ctags_tags_name = 'tags'
let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'

" FZF Settings
" ==================================================
" This is the default extra key bindings
" set rtp+=/usr/local/opt/fzf
" let g:fzf_action = {
"   \ 'ctrl-t': 'tab split',
"   \ 'ctrl-x': 'split',
"   \ 'ctrl-v': 'vsplit' }

" " Default fzf layout
" let g:fzf_layout = { 'down': '~40%' }
" let g:fzf_tags_command = 'git ctags'

" imap <c-x><c-l> <plug>(fzf-complete-line)
" nnoremap <C-p> :Tags<CR>
" nnoremap <leader>f :Files<CR>
" nnoremap <leader>l :Lines<CR>

" Deoplete Completion
" ================================================
" Don't forget to start deoplete

" Markdown Preview
let g:mkdp_path_to_chrome = "open -a Safari"
nnoremap <leader>md :MarkdownPreview<CR>

" SLIME for REPL
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

" vim:set sw=2 sts=2 foldmethod=marker:
