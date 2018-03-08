if has("gui_macvim")
    " ================================================
    " CtrlP Settings - When in macvim
    " ================================================
    nnoremap <C-p> :CtrlPTag<CR>
    nnoremap <leader>f :CtrlP<CR>
    let g:ctrlp_map = '<c-p>'
    let g:ctrlp_working_path_mode = 'ra'
    let g:ctrlp_custom_ignore = {
                \ 'dir':  '\v[\/]\.(git|hg|svn|target)$',
                \ 'file': '\v\.(exe|so|dll)$',
                \ 'link': 'some_bad_symbolic_links',
                \ }
else
    " ================================================
    " FZF Settings - When in iterm
    " ================================================
    " This is the default extra key bindings
    set rtp+=/usr/local/opt/fzf
    let g:fzf_action = {
                \ 'ctrl-t': 'tab split',
                \ 'ctrl-x': 'split',
                \ 'ctrl-v': 'vsplit' }

    " Default fzf layout
    let g:fzf_layout = { 'down': '~40%' }
    let g:fzf_tags_command = 'git ctags'

    imap <c-x><c-l> <plug>(fzf-complete-line)
    nnoremap <C-p> :Tags<CR>
    nnoremap <leader>f :Files<CR>
    nnoremap <leader>l :Lines<CR>
endif
