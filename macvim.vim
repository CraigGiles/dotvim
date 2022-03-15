" NOTE: font size 11 means on my monitor i can run it 'fullscreen' and not have extra pixels
nnoremap <D-F10> :RunFullScreen<CR>

" Don't have scroll bars
set guioptions=

" nnoremap <D-j> :TagbarOpenAutoClose<CR>
nnoremap <D-j> :CtrlPFunky<CR>
nnoremap <D-f> :CtrlP<CR>
nnoremap <D-b> :CtrlPBuffer<CR>
nnoremap <D-p> :CtrlP<CR>

" FZF key bindings
"nnoremap <D-f> :Files<CR>
"nnoremap <D-b> :Buffers<CR>
"nnoremap <D-p> :Files<CR>

nnoremap <D-m> :MakeWithoutAsking<CR>
nnoremap <D-n> :cnext<CR>
nnoremap <D-N> :cprev<CR>
nnoremap <D-6> :OtherWindowVertical<CR><C-^>:OtherWindowVertical<CR>

" Testing these for folding methods
" set foldmethod=syntax
" nnoremap <D-=> :set foldlevel=10<CR>
" nnoremap <D--> :set foldlevel=0<CR>
