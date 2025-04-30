augroup PureCAutoCommmands
    autocmd!
    autocmd BufWritePost *.c RemoveTrailingWhitespace
    autocmd FileType c setlocal commentstring=\/\/\ %s
    autocmd FileType make setlocal commentstring=#\ %s
augroup END

" We want to keep comments within an 80 column limit, but not code.
" These two options give us that
setlocal formatoptions=crq
setlocal textwidth=80
setlocal commentstring=//\ %s
