" ================================================
" Key Bindings
" ================================================
let mapleader = "\<Space>"

" After doing a search, hitting 'CTRL-f-f' will fold all
" the results for easier display
nmap <silent> <expr>  <C-f><C-f>  FS_ToggleFoldAroundSearch({'context':1})

nmap <F4> :Dispatch make clean && make run<CR>
nmap <F5> :Dispatch make run<CR>
nmap <C-b> :Dispatch make<CR>
nmap <C-n> :Dispatch make clean && make run<CR>

" newline above and below without entering insert mode
nnoremap <leader>o o<Esc>k
nnoremap <leader>O O<Esc>j

" map S to auto fill the search / replace
nmap S :%s/\v/gc<LEFT><LEFT><LEFT>

" Change split orientation from | to -
nnoremap <leader>sp <C-w>t<C-w>K
nnoremap <leader>vs <C-w>t<C-w>H

" Down is really the next line
nnoremap j gj
nnoremap k gk

" Escape to normal mode from insert mode with jj / jk
inoremap jj <ESC>
inoremap jk <ESC>

" Increase split size by 5
nnoremap = :vertical resize +5<CR>
nnoremap + :resize +5<CR>

" git related commands
nnoremap ga :Gblame<CR>

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

" Underline the current line with '=' or '-' or '~'
nnoremap <silent> <leader>u= :t.\|s/./=/g\|:nohls<cr>
nnoremap <silent> <leader>u- :t.\|s/./-/g\|:nohls<cr>
nnoremap <silent> <leader>u~ :t.\|s/./\\~/g\|:nohls<cr>

" Navigate splits with just CTRL-HJKL
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

" vim:set sw=2 sts=2 foldmethod=marker foldlevel=0:
