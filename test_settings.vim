" -------------------------------------------------
"   Test Settings
" =================================================

" This creates a new Help command and binds it to <C-h> which will open the
" help window in the OtherWindowVertical (see functions.vim) and allow the
" C-^ command to be used in order to go to previous the buffer
"
" TODO(craig) make a HelpBuffer function maybe actually take some arguments
command! -nargs=1 -complete=help Help :enew | :set buftype=help | :keepalt h <args>
nnoremap <C-h> :OtherWindowVertical<CR>:Help 

" TODO(craig) try to get Magit to use the other window if open, split if not
" command! magit :OtherWindowVertical<CR>:Magit<CR> 
" command! MagitV :enew | :set buftype=nofile | :keepalt :Magit<CR>
cnoreabbrev magit Magit


