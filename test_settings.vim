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

function! HelpCommand(term)
    " save current window
    " 
    " for each window open
    "   set cursor to that window
    "   if file type is help
    "   help_found = true
    " endfor
    "
    " if help_found 
    "   launch help command
    " else
    "   launch Help command
    " endif
    "

    " TODO this doesn't really get me where i want to go
    " let l:current_buffer = bufnr()
    " let l:help_buffer_exists = bufexists($VIMRUNTIME + "/adf/*.txt")
    " echo l:help_buffer_exists
    " NOTE
    " current window buffer number
    " :echo winbufnr(winnr())

    " " 'previous' window buffer number
    " :echo winbufnr(winnr('#'))

    " " Name of the 'previous' window buffer number
    " :echo bufname(winbufnr(winnr('#')))"
    " let l:file_type = &filetype bufwinnr("Help") 
endfunction

" TODO(craig) try to get Magit to use the other window if open, split if not
" command! magit :OtherWindowVertical<CR>:Magit<CR> 
" command! MagitV :enew | :set buftype=nofile | :keepalt :Magit<CR>
" NOTE This is the one that workedcnoreabbrev magit Magit

