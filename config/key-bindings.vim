" ================================================
" Key Bindings
" ================================================
let mapleader = "\<Space>"

" After doing a search, hitting 'CTRL-f-f' will fold all
" the results for easier display
nmap <silent> <expr>  <C-f><C-f>  FS_ToggleFoldAroundSearch({'context':1})

" map S to auto fill the search / replace
nmap S :%s/\v/gc<LEFT><LEFT><LEFT>

" Easy opening of splits
nnoremap vs :vs<CR>
nnoremap sp :sp<CR>

" Change two vertical splits to horizontal splits
nnoremap <leader>sp <C-w>t<C-w>K

" Change two horizontal splits to vertical splits
nnoremap <leader>vs <C-w>t<C-w>H

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Escape to normal mode from insert mode with jj
inoremap jj <ESC>
inoremap jk <ESC>

" Increase split size by 5
nnoremap = :vertical resize +5<CR>
nnoremap + :resize +5<CR>

" git related commands
nnoremap ga :Gblame<CR>

" Jump to definition, <C-t> jumps back
nnoremap <C-b> g]

" Buffer navigation
nnoremap <leader>ls :ls<CR>:buffer<Space>
nnoremap <leader>lS :ls<CR>:sbuffer<Space>

" Code Completion
inoremap <C-Space> <C-x><C-o>

" When selecting text in visual mode,
" Delete or Backspace removes it
vmap <BS> x

" Turn off that stupid highlight search
nnoremap <silent> <leader>n :nohls<CR>

" Underline the current line with '='
nnoremap <silent> <leader>u= :t.\|s/./=/g\|:nohls<cr>
nnoremap <silent> <leader>u- :t.\|s/./-/g\|:nohls<cr>
nnoremap <silent> <leader>u~ :t.\|s/./\\~/g\|:nohls<cr>

" Try finding the ⇒ as a =>
nmap f= :call search('=\\|⇒')<CR>
nmap f- :call search('-\\|→')<CR>
nmap f< :call search('-\\|←')<CR>
nmap f> :call search('-\\|→')<CR>

" Move splits with just CTRL-HJKL
nnoremap <C-h> <C-w>h
nnoremap <C-k> <C-w>k
nnoremap <C-j> <C-w>j
nnoremap <C-l> <C-w>l

" Make search results be in the center of the window
nmap n nzz
nmap N Nzz
nmap * *zz
nmap # #zz
nmap g* g*zz
nmap g# g#zz

" Ensime
nnoremap <leader>et :EnType<CR>
nnoremap <leader>ed :EnDeclaration<CR>

