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

" Deoplete Completion
" ================================================
" Don't forget to start deoplete

" Markdown Preview
let g:mkdp_path_to_chrome = "open -a Safari"
nnoremap <leader>md :MarkdownPreview<CR>

" SLIME for REPL
let g:slime_target = "tmux"
let g:slime_paste_file = "$HOME/.slime_paste"

" vim-markdown
let g:markdown_mapping_switch_status = '<Leader>ms'
