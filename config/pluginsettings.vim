" ================================================
" Plugin Settings
" ================================================

" vim-scala
let g:scala_use_default_keymappings = 0

" scalapackage.vim
let g:scala_package_flat_package = 0

" CtrlP Settings
" nnoremap <leader>t :CtrlPTag<CR>
" nnoremap <leader>p :CtrlPTag<CR>
" nnoremap <leader>f :CtrlP<CR>
" let g:ctrlp_map = '<c-p>'
" let g:ctrlp_cmd = 'CtrlPTag'
" let g:ctrlp_working_path_mode = 'ra'
" let g:ctrlp_custom_ignore = {
"   \ 'dir':  '\v[\/]\.(git|hg|svn|target)$',
"   \ 'file': '\v\.(exe|so|dll)$',
"   \ 'link': 'some_bad_symbolic_links',
"   \ }

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

augroup ScalaAutoCommmands
    autocmd!
    autocmd BufWritePost *.scala RemoveTrailingWhitespace
augroup END

" Ensime settings
augroup EnsimeTypeCheck
    autocmd!
    autocmd BufWritePost *.scala silent :EnTypeCheck
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

" vim-scaladoc
command -nargs=1 ScalaDoc <expr> call scaladoc#Search(<f-args>)
nnoremap <C-k> :call ScalaDoc(expand("<cword>"))<CR>
