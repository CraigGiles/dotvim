augroup PureCAutoCommmands
    autocmd!
    autocmd BufWritePost *.c RemoveTrailingWhitespace
    autocmd FileType c setlocal commentstring=\/\/\ %s
    autocmd FileType make setlocal commentstring=#\ %s
augroup END
