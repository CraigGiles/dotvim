" {{{ Plugins
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
Plug 'ctrlpvim/ctrlp.vim'
Plug 'christoomey/vim-tmux-navigator'
Plug 'wesQ3/vim-windowswap'     " <- Use via <leader>ww -> <leader>ww
Plug 'tpope/vim-endwise'
Plug 'xtal8/traces.vim'
""}}}
""{{{ Scala Plugins
Plug 'derekwyatt/vim-sbt'
Plug 'derekwyatt/vim-scala'
Plug 'craiggiles/scala.vim'
Plug 'jpalardy/vim-slime'
Plug 'GEverding/vim-hocon'
Plug 'solarnz/thrift.vim'
" Plug 'ensime/ensime-vim'
"" }}}
""{{{ Colorschemes
Plug 'jnurmine/Zenburn'
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
" Plug 'gabrielelana/vim-markdown'
Plug 'iamcco/markdown-preview.vim'
""}}}
""{{{ Testing these plugins
" Code completion
Plug 'gabesoft/vim-ags'
Plug 'w0rp/ale'
" Plug 'Valloric/YouCompleteMe', { 'do': './install.py --clang-completer --java-completer' }
Plug 'majutsushi/tagbar'

"}}}
""{{{ No longer using these plugins
" Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all' }
" Plug 'junegunn/fzf.vim'
" Plug 'junegunn/vim-peekaboo'
" Plug 'nixon/vim-vmath'
" Plug 'scrooloose/nerdtree'
"}}}
"{{{ SNES Plugins
  Plug 'ARM9/snes-syntax-vim'
"}}}
call plug#end()
"}}}
"{{{ Plugin Settings

"{{{ ALE settings
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
"}}}
"{{{ CtrlP Settings
nnoremap <leader>t :CtrlPTag<CR>
nnoremap <leader>p :CtrlPTag<CR>
nnoremap <leader>f :CtrlP<CR>

let g:ctrlp_map = '<c-p>'
let g:ctrlp_cmd = 'CtrlPTag'
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|target)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }
"}}}
"{{{ NERDTree Settings
" ================================================
" " Open/Close NERDTree
" nnoremap - :NERDTreeToggle<CR>
" nnoremap _ :NERDTreeFind<CR>
" let NERDTreeHijackNetrw=1
" let NERDTreeQuitOnOpen=1
"}}}
"{{{ tags
" let g:auto_ctags = 1
" let g:auto_ctags_directory_list = ['.git', '.svn']
" let g:auto_ctags_tags_name = 'tags'
" let g:auto_ctags_tags_args = '--tag-relative --recurse --sort=yes'
"}}}
"{{{ FZF Settings
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
"}}}
"{{{ Markdown Preview
let g:mkdp_path_to_chrome = "open -a Safari"
nnoremap <leader>md :MarkdownPreview<CR>
"}}}
"{{{ SLIME for REPL
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"
"}}}
"
"{{{ SNES Syntax
au BufNewFile,BufRead *.asm,*.inc set filetype=snes
"}}}
"}}}

" vim:set sw=2 sts=2 foldmethod=marker foldlevel=0:
