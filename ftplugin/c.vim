augroup PureCAutoCommmands
    autocmd!
    autocmd BufWritePost *.c RemoveTrailingWhitespace
    autocmd BufWritePost *.cpp RemoveTrailingWhitespace
    autocmd BufWritePost *.h RemoveTrailingWhitespace
    autocmd BufWritePost *.hpp RemoveTrailingWhitespace
    autocmd FileType c setlocal commentstring=//\ %s
    autocmd FileType cpp setlocal commentstring=//\ %s
    autocmd FileType h setlocal commentstring=//\ %s
    autocmd FileType hpp setlocal commentstring=//\ %s

    autocmd FileType make setlocal commentstring=#\ %s
augroup END
