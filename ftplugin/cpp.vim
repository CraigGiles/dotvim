augroup CPPAutoCommmands
    autocmd!
    autocmd BufWritePost *.c,*.cpp,*.h,*.hpp RemoveTrailingWhitespace
    autocmd FileType c,cpp,h,hpp setlocal commentstring=//\ %s

    autocmd FileType make setlocal commentstring=#\ %s
augroup END
" nnoremap <C-z> :g/^\S\+.*(.*()\\|\n.*))(.*{\\|\n.*{)/#<CR>
