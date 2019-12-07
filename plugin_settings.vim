" ctrlp
let g:ctrlp_cmd = 'CtrlPTag'
let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
let g:ctrlp_use_caching = 0
let g:ctrlp_working_path_mode = 'ra'
let g:ctrlp_custom_ignore = {
  \ 'dir':  '\v[\/]\.(git|hg|svn|target)$',
  \ 'file': '\v\.(exe|so|dll)$',
  \ 'link': 'some_bad_symbolic_links',
  \ }

" markdown preview
let g:mkdp_path_to_chrome = "open -a Safari"
nnoremap <Space>md :MarkdownPreview<CR>

" the_silver_searcher
let g:ags_enable_async = 1

" vim:set sw=2 sts=2 foldmethod=marker foldlevel=0:

