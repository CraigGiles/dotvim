" ==================================================
" FZF Settings
" ==================================================
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
